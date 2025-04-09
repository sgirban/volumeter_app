import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:image/image.dart' as img;

class ThumbnailService {
  static Future<Uint8List?> getThumbnail(
    String path, {
    int maxSize = 128,
  }) async {
    final recivePort = ReceivePort();
    await Isolate.spawn(
      _generateIsolate,
      _IsolateData(recivePort.sendPort, path, maxSize),
    );
    return await recivePort.first as Uint8List?;
  }

  static void _generateIsolate(_IsolateData data) {
    try {
      final bytes = File(data.path).readAsBytesSync();
      final image = img.decodeImage(bytes)!;
      final thumbnail = img.copyResize(
        image,
        width: data.maxSize,
        maintainAspect: true,
      );
      final png = Uint8List.fromList(img.encodePng(thumbnail));
      data.sendPort.send(png);
    } catch (e) {
      data.sendPort.send(null);
    }
  }
}

class _IsolateData {
  final SendPort sendPort;
  final String path;
  final int maxSize;
  _IsolateData(this.sendPort, this.path, this.maxSize);
}

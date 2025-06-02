import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:volumeter/features/workspace/domain/models/file_chunker.dart';

Future<void> copyFileUsingChunking(
  String sourcePath,
  String destinationPath,
  String pid,
) async {
  final file = await File(destinationPath).create();
  final sink = file.openWrite();
  await for (final chunk in FileChunker.chunkFile(File(sourcePath), pid)) {
    sink.add(chunk.chunkData);
  }
  await sink.close();
}

void main() {
  test('truoi', () async {
    final tempDir = Directory.systemTemp.createTempSync('chunk_test');
    debugPrint('Temp directory: ${tempDir.path}');
    try {
      final sourceFile = File('${tempDir.path}/source.txt');
      sourceFile.writeAsString('This is a test file. Source e muhaha!!!!');
      final destinationFile = File('${tempDir.path}/destination.txt');
      await copyFileUsingChunking(
        sourceFile.path,
        destinationFile.path,
        'test_project_id',
      );
      assert(await destinationFile.exists(), isTrue);
    } finally {
      // tempDir.deleteSync(recursive: true);
    }
  });
}

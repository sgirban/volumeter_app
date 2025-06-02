import 'dart:io';
import 'package:volumeter/protos/generated/volume_estimation.pbgrpc.dart';

class FileChunker {
  static const int chunkSize = 1024 * 512;
  static Stream<ProjectChunk> chunkFile(File file, String projectId) async* {
    final fileSize = await file.length();
    final totalChunks = (fileSize / chunkSize).ceil();
    final raf = await file.open(mode: FileMode.read);
    try {
      for (int i = 0; i < totalChunks; i++) {
        final bytes = await raf.read(chunkSize);
        yield ProjectChunk(
          projectId: projectId,
          chunkData: bytes,
          chunkIndex: i,
          totalChunks: totalChunks,
        );
      }
    } finally {
      await raf.close();
    }
  }
}

import 'dart:io';
import 'package:volumeter/protos/generated/volume_estimation.pbgrpc.dart';

class FileChunker {
  static const int chunkSize = 1024 * 512;
  static Stream<ProjectChunk> chunkFile(File file, String projectId) async* {
    final fileSize = await file.length();
    final totalChunks = (fileSize / chunkSize).ceil();
    for (int i = 0; i < totalChunks; i++) {
      final offset = i * chunkSize;
      final chunk = await file.openRead(offset, offset + chunkSize).toList();
      yield ProjectChunk(
        projectId: projectId,
        chunkData: chunk.first,
        chunkIndex: i,
        isLastChunk: i == totalChunks - 1,
      );
    }
  }
}

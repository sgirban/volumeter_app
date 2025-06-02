import 'dart:io';
import 'package:volumeter/core/grpc/grpc_client.dart';
import 'package:volumeter/core/utils/logger.dart';
import 'package:volumeter/core/utils/project/compress_project_utils.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/workspace/domain/models/file_chunker.dart';
import 'package:volumeter/protos/generated/volume_estimation.pb.dart'
    show ProcessingStatus;

Future<Stream<ProcessingStatus>> processProject(ProjectMetadata project) async {
  final client = GrpcClient();
  final compressed = await compressProject(project);
  final projectId = project.id;
  final fileStream = FileChunker.chunkFile(File(compressed), projectId);
  logger.d('Processing project: ${project.name} with ID: $projectId');
  logger.d('File stream created for project ID: $projectId');
  final responseStream = await client.processProject(fileStream);
  return responseStream;
}

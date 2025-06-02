import 'dart:io';
import 'package:volumeter/core/utils/logger.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:archive/archive.dart';

Future<String> compressProject(ProjectMetadata project) async {
  final projectPath = project.path;
  final outputPath = '$projectPath/../../processing/${project.id}.zip';
  final archive = Archive();

  final dir = Directory(projectPath);
  for (final file in dir.listSync(recursive: true)) {
    if (file is File) {
      final bytes = await file.readAsBytes();
      final relativePath = file.path
          .substring(projectPath.length + 1)
          .replaceAll('\\', '/');
      final archiveFile = ArchiveFile(relativePath, bytes.length, bytes);
      archive.addFile(archiveFile);
    } else if (file is Directory) {
      final relativePath = file.path
          .substring(projectPath.length + 1)
          .replaceAll('\\', '/');
      final archiveDir = ArchiveFile.directory(relativePath);
      archive.addFile(archiveDir);
    }
  }
  final zipEncoder = ZipEncoder();
  final zipBytes = zipEncoder.encode(archive);
  final outputFile = await File(outputPath).create(recursive: true);
  await outputFile.writeAsBytes(zipBytes);
  logger.d('Project compressed to: $outputPath');
  return outputFile.path;
}

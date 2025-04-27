import 'dart:io';
import 'package:flutter/material.dart' show debugPrint;
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:archive/archive.dart';

Future<void> compressProject(ProjectMetadata project) async {
  final projectPath = project.path;
  final outputPath = '$projectPath/../../processing/${project.id}.zip';
  final archive = Archive();

  final dir = Directory(projectPath);
  for (final file in dir.listSync(recursive: true)) {
    if (file is File) {
      final bytes = await file.readAsBytes();
      final relativePath = file.path.substring(projectPath.length + 1);
      final archiveFile = ArchiveFile(relativePath, bytes.length, bytes);
      archive.addFile(archiveFile);
    } else if (file is Directory) {
      final relativePath = file.path.substring(projectPath.length + 1);
      final archiveDir = ArchiveFile.directory(relativePath);
      archive.addFile(archiveDir);
    }
  }
  final zipEncoder = ZipEncoder();
  final zipBytes = zipEncoder.encode(archive);
  final outputFile = await File(outputPath).create(recursive: true);
  await outputFile.writeAsBytes(zipBytes);
  debugPrint('Compressed project to $outputPath');
}

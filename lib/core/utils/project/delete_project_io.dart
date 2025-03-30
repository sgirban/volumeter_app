import 'dart:io';
import 'package:volumeter/core/utils/logger.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';

Future<bool> deleteProjectIO(ProjectMetadata project) async {
  final projectDir = Directory(project.path);
  try {
    await projectDir.delete(recursive: true);
    return true;
  } catch (e) {
    logger.e(
      'The project `${project.name}` with id: ${project.id} could not be deleted'
      '\n'
      'This error ocurred: $e',
    );

    return false;
  }
}

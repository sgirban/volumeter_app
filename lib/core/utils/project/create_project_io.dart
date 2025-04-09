import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:volumeter/core/constants/app_numbers.dart';
import 'package:volumeter/core/utils/logger.dart';
import 'package:volumeter/core/utils/project/application_paths.dart';
import 'package:volumeter/features/projects/domain/models/assets_manifest.dart';
import 'package:volumeter/features/projects/domain/models/project_file.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/projects/domain/models/project_mode.dart';
import 'package:volumeter/features/projects/domain/models/project_status.dart';

/// The function utility that creates the project files and directories
/// and build up the project general structure
///
Future<ProjectMetadata?> createProjectIO({
  required String projectName,
  required ProjectMode mode,
}) async {
  final rootDir = ApplicationPaths().projectsDir;
  final String projectID = const Uuid().v4();

  /// Create the [ProjectMetadata] to use further
  final project = ProjectMetadata(
    id: projectID,
    path: '$rootDir/$projectID',
    name: projectName,
    description: 'A new volume estimation project',
    color: 0xffffffff,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    status: ProjectStatus.pending,
    mode: mode,
  );
  if (Directory(project.path).existsSync()) {
    logger.e(
      'Project ${project.name} already exists or ID conflict for: ${project.id}',
    );
    return null;
  }
  _generateInitialThumbnail(project);
  final result = await compute(_createProjectIsolate, project);
  if (result) {
    return project;
  } else {
    return null;
  }
}

bool _createProjectIsolate(ProjectMetadata project) {
  try {
    /// Creating directory structure
    _createDirectoryStructure(
      projectID: project.id,
      projectPath: project.path,
      mode: project.mode,
      projectName: project.name,
    );

    /// Initializing Config files
    _initializeConfigFiles(project);

    ///Create project file
    _createProjectFile(project);

    return true;
  } catch (e) {
    logger.e(
      'The project ${project.name} could not be created!'
      '\n'
      '$e',
    );
    return false;
  }
}

void _createProjectFile(ProjectMetadata project) {
  final projectFile = File('${project.path}/project.vproj');
  projectFile.writeAsStringSync(
    jsonEncode(<String, dynamic>{
      'version': 1.0,
      'project_root': project.path,
      'id': project.id,
      'name': project.name,
      'created': project.createdAt.toIso8601String(),
      'last_update': project.updatedAt.toIso8601String(),
    }),
  );
}

/// Function utility for crating the I/O file system structure
void _createDirectoryStructure({
  required String projectPath,
  required String projectID,
  required String projectName,
  required ProjectMode mode,
}) {
  final dirs = [
    'config/thumbnails',
    'exports/processed',
    'temp',
    if (mode.isRGB) 'assets/rgb/raw',
    if (mode.isRGB) 'assets/rgb/edited',
    if (mode.isRGBD) 'assets/rgbd/rgb',
    if (mode.isRGBD) 'assets/rgbd/depth',
  ];

  final projectDir = Directory(projectPath);
  projectDir.createSync(recursive: true);
  for (final dir in dirs) {
    Directory('${projectDir.path}/$dir').createSync(recursive: true);
  }
}

void _initializeConfigFiles(ProjectMetadata project) {
  /// Project Settings
  ///
  /// `project_settings.json`
  File(
    '${project.path}/config/project_settings.json',
  ).writeAsStringSync(jsonEncode(ProjectFile.initial(project).toJson()));

  /// `sync_manifest.json`
  ///
  /// Stores informations about linking the RGB and the RGB-D imagesS
  if (project.mode.isRGBD) {
    File(
      '${project.path}/assets/rgbd/sync_manifest.json',
    ).writeAsStringSync(jsonEncode({'pairs': []}));
  }
  File(
    '${project.path}/assets/assets_manifest.json',
  ).writeAsStringSync(jsonEncode(AssetsManifest(assets: []).toJson()));

  File(
    '${project.path}/config/server_config.json',
  ).writeAsStringSync(jsonEncode({'server_name': 'Volumeter Server'}));
}

void _generateInitialThumbnail(ProjectMetadata project) async {
  final int thumbnailNum = Random().nextInt(kThumbnailNum);
  final thumbnail = File('${project.path}/thumbnails/project_thumb.jpg');
  await thumbnail.create(recursive: true);
  final image = await rootBundle.load(
    'assets/thumbnails/thumbnail_$thumbnailNum.jpg',
  );
  thumbnail.writeAsBytes(image.buffer.asUint8List());
}

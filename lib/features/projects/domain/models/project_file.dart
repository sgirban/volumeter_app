import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';

part 'project_file.g.dart';

@JsonSerializable()
class ProjectFile {
  final double version;
  final String projectRoot;
  final String id;
  final String created;
  final String lastUpdate;

  const ProjectFile({
    required this.version,
    required this.projectRoot,
    required this.id,
    required this.created,
    required this.lastUpdate,
  });

  factory ProjectFile.initial(ProjectMetadata project) => ProjectFile(
    version: 1.0,
    projectRoot: project.path,
    id: project.id,
    created: project.createdAt.toIso8601String(),
    lastUpdate: project.updatedAt.toIso8601String(),
  );
  factory ProjectFile.fromJson(Map<String, dynamic> json) =>
      _$ProjectFileFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectFileToJson(this);
}

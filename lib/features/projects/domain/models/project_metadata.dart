import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:volumeter/features/projects/domain/models/project_mode.dart';
import 'package:volumeter/features/projects/domain/models/project_status.dart';

part 'project_metadata.freezed.dart';

@freezed
abstract class ProjectMetadata with _$ProjectMetadata {
  const factory ProjectMetadata({
    @HiveField(0) required String id,
    @HiveField(1) required String path,
    @HiveField(2) required String name,
    @HiveField(3) required String description,
    @HiveField(4) required int color,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
    @HiveField(7) required ProjectStatus status,
    @HiveField(8) required ProjectMode mode,
  }) = _ProjectMetadata;
  factory ProjectMetadata.defaults() {
    return ProjectMetadata(
      id: '#default',
      path: 'default',
      name: 'Default project example',
      description: 'default project description',
      color: 0xffffffff,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: ProjectStatus.pending,
      mode: ProjectMode.auto,
    );
  }
}

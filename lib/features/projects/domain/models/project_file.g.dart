// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectFile _$ProjectFileFromJson(Map<String, dynamic> json) => ProjectFile(
  version: (json['version'] as num).toDouble(),
  projectRoot: json['projectRoot'] as String,
  id: json['id'] as String,
  created: json['created'] as String,
  lastUpdate: json['lastUpdate'] as String,
);

Map<String, dynamic> _$ProjectFileToJson(ProjectFile instance) =>
    <String, dynamic>{
      'version': instance.version,
      'projectRoot': instance.projectRoot,
      'id': instance.id,
      'created': instance.created,
      'lastUpdate': instance.lastUpdate,
    };

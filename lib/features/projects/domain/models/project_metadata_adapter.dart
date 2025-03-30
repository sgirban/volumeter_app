import 'package:hive/hive.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/projects/domain/models/project_mode.dart';
import 'package:volumeter/features/projects/domain/models/project_status.dart';

class ProjectMetadataAdapter extends TypeAdapter<ProjectMetadata> {
  @override
  final int typeId = 2;

  @override
  ProjectMetadata read(BinaryReader reader) {
    return ProjectMetadata(
      id: reader.readString(),
      path: reader.readString(),
      name: reader.readString(),
      description: reader.readString(),
      color: reader.readInt(),
      createdAt: DateTime.parse(reader.readString()),
      updatedAt: DateTime.parse(reader.readString()),
      status: ProjectStatus.values[reader.readInt()],
      mode: ProjectMode.values[reader.readInt()],
    );
  }

  @override
  void write(BinaryWriter writer, ProjectMetadata obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.path);
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeInt(obj.color);
    writer.writeString(obj.createdAt.toIso8601String());
    writer.writeString(obj.updatedAt.toIso8601String());
    writer.writeInt(obj.status.index);
    writer.writeInt(obj.mode.index);
  }
}

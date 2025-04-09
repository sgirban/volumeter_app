import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
part 'workspace_state.freezed.dart';

@freezed
sealed class WorkspaceState with _$WorkspaceState {
  const factory WorkspaceState({
    required String workspacePath,
    required ProjectMetadata project,
    @Default([]) Set<String> selectedAsset,
  }) = _WorkspaceState;
}

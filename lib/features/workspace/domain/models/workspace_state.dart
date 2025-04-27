import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/workspace/domain/models/workspace_view_type.dart';
part 'workspace_state.freezed.dart';

@freezed
sealed class WorkspaceState with _$WorkspaceState {
  const factory WorkspaceState({
    required String workspacePath,
    required ProjectMetadata project,
    @Default(WorkspaceViewType.view2D) WorkspaceViewType viewType,
    @Default([]) Set<String> selectedAsset,
  }) = _WorkspaceState;
}

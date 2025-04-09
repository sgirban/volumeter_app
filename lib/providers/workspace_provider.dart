import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/workspace/domain/models/workspace_state.dart';

class WorkspaceProviderNotifier extends StateNotifier<WorkspaceState> {
  WorkspaceProviderNotifier()
    : super(
        WorkspaceState(workspacePath: '', project: ProjectMetadata.defaults()),
      );

  void newWorkspace(ProjectMetadata project) {
    state = WorkspaceState(workspacePath: project.path, project: project);
  }

  void selectAsset(String assetId) {
    state = state.copyWith(selectedAsset: {assetId});
  }
}

final workspaceProvider =
    StateNotifierProvider<WorkspaceProviderNotifier, WorkspaceState>(
      (ref) => WorkspaceProviderNotifier(),
    );

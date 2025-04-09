import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/providers/assets_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

void projectWorkspaceInit(ProjectMetadata project, WidgetRef ref) {
  // Initialize the project workspace with default values
  // This function can be used to set up the initial state of the project workspace
  // when a new project is created or opened.
  // For example, you can create default directories, files, etc.
  // You can also load any necessary resources or configurations.
  // This is a placeholder function and can be customized as per your requirements.

  ref.read(workspaceProvider.notifier).newWorkspace(project);
  ref.read(assetsProvider.notifier).loadAllAssets(project);
}

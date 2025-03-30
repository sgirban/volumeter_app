import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart'
    show ReorderedListFunction;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/services/hive_service.dart';

/// A provider that holds a list of [ProjectMetadata] objects
///
class ProjectsProvider extends StateNotifier<List<ProjectMetadata>> {
  ProjectsProvider() : super([]) {
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final projects = await HiveService().loadAll<ProjectMetadata>();
    if (projects.isNotEmpty) {
      state = projects;
    }
  }

  void reorderProjects(int oldIndex, int newIndex) {
    final items = List<ProjectMetadata>.from(state);
    final item = items.removeAt(oldIndex);
    items.insert(newIndex > oldIndex ? newIndex - 1 : newIndex, item);
    state = items;
  }

  void rearangeProjects(ReorderedListFunction<ProjectMetadata> reorderedList) {
    state = reorderedList(state);
  }

  /// Adds a new project to the list
  void addProject(ProjectMetadata project) {
    state = [...state, project];
    _saveToHive();
  }

  /// Removes a project from the list
  void removeProject(ProjectMetadata project) {
    state = state.where((p) => p.id != project.id).toList();
    _saveState();
  }

  // Updates a project in the list
  void updateProject(ProjectMetadata project) {
    state = state.map((p) => p.id == project.id ? project : p).toList();
    _saveToHive();
  }

  /// Saves all projects in the state to Hive
  ///
  /// This is a private method that should only be called from within this provider
  ///
  void _saveToHive() async {
    for (final project in state) {
      HiveService().save<ProjectMetadata>(key: project.id, value: project);
    }
  }

  /// Clears the hive storage and saves all the projects in the state to hive
  ///
  /// This is a private method that should only be called from within this provider
  ///
  void _saveState() async {
    await HiveService().clear<ProjectMetadata>();
    for (final project in state) {
      await HiveService().save<ProjectMetadata>(
        key: project.id,
        value: project,
      );
    }
  }
}

/// A provider that holds a list of selected project ids
///
class ProjectsSelectionProvider extends StateNotifier<Set<String>> {
  ProjectsSelectionProvider() : super({});

  /// Selects a project that has the given id [projectId].
  void selectProject(String projectId) {
    state = {...state, projectId};
  }

  /// Deselects a project that has the given id [projectId].
  void deselectProject(String projectId) {
    state = state.where((id) => id != projectId).toSet();
  }

  /// Clears the selection
  void clearSelection() {
    state = <String>{};
  }

  /// If the project is selected, deselect it, otherwise select it
  ///
  void toggleProjectSelection(String projectId) {
    if (state.contains(projectId)) {
      deselectProject(projectId);
    } else {
      selectProject(projectId);
    }
  }
}

final projectProvider =
    StateNotifierProvider<ProjectsProvider, List<ProjectMetadata>>(
      (ref) => ProjectsProvider(),
    );

final projectSelectionProvider =
    StateNotifierProvider<ProjectsSelectionProvider, Set<String>>(
      (ref) => ProjectsSelectionProvider(),
    );

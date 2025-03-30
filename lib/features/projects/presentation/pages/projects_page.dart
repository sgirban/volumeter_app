import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/projects/presentation/widgets/batch_project_action_bar.dart';
import 'package:volumeter/features/projects/presentation/widgets/create_project_dialog.dart';
import 'package:volumeter/features/projects/presentation/widgets/project_grid.dart';
import 'package:volumeter/providers/projects_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';

class ProjectsPage extends ConsumerStatefulWidget {
  const ProjectsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ConsumerState<ProjectsPage> {
  /// Builds the empty state of the page when there are no projects
  Widget _buildEmptyState(BuildContext context) {
    final isBright = ref.read(
      themeProvider.select((s) => s.colors.brightness == Brightness.light),
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isBright)
            const Image(
              height: 200,
              fit: BoxFit.contain,
              image: AssetImage('assets/images/folder_empty_state.png'),
            ),
          if (!isBright)
            const Image(
              height: 200,
              fit: BoxFit.contain,
              image: AssetImage('assets/images/folder_empty_state_dark.png'),
            ),
          const SizedBox(height: 16.0),
          Text(
            context.localizations.noProjects,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;
    final textTheme = ref.read(themeProvider.select((s) => s.text));
    final colors = ref.read(themeProvider.select((s) => s.colors));
    final selectionMode = ref.watch(projectSelectionProvider).isNotEmpty;
    final isEmptyState = ref.watch(projectProvider).isEmpty;
    if (isDesktopWeb) {
      return fluent.ScaffoldPage(
        header: fluent.PageHeader(
          title: fluent.Row(
            children: [
              Text(
                localizations.myProjects,
                style: textTheme.headlineMedium.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: colors.onSurface,
                ),
              ),
              const Spacer(),

              fluent.Column(
                children: [
                  FilledButton.icon(
                    onPressed: () => _showCreateProjectDialog(context),
                    icon: const Icon(Icons.create_new_folder, size: 20),
                    label: Text(localizations.newProject),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.view_list),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_upward),

                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        content:
            isEmptyState
                ? _buildEmptyState(context)
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: fluent.Stack(
                    children: [
                      const ProjectGrid(),
                      if (selectionMode)
                        const Positioned(
                          bottom: 16.0,
                          left: 64.0,
                          right: 64.0,
                          child: BatchProjectActionBar(),
                        ),
                    ],
                  ),
                ),
      );
    }

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                localizations.myProjects,
                style: textTheme.headlineMedium.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: colors.onSurface,
                ),
              ),
            ),
            if (isEmptyState) const Spacer(),
            isEmptyState
                ? _buildEmptyState(context)
                : const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ProjectGrid(),
                  ),
                ),
            if (isEmptyState) const Spacer(flex: 2),
          ],
        ),
        _buildMenuButton(context, ref),
      ],
    );
  }

  Widget _buildMenuButton(BuildContext context, WidgetRef ref) {
    final colors = ref.read(themeProvider.select((s) => s.colors));
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: FloatingActionButton(
        backgroundColor: colors.primary,
        onPressed: () => _showCreateProjectDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// The create project dialog
  void _showCreateProjectDialog(BuildContext context) async {
    if (isDesktopWeb) {
      fluent.showDialog<String>(
        context: context,
        builder: (context) => const CreateProjectDialog(),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const CreateProjectDialog(),
      );
    }
  }
}

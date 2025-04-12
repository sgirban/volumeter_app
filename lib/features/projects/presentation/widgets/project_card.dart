import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/adaptive/widgets/adaptive_dialog.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/routes/router.dart'
    show rootNavigatorKey, router;
import 'package:volumeter/core/utils/logger.dart';
import 'package:volumeter/core/utils/project/delete_project_io.dart';
import 'package:volumeter/core/utils/project/workspace_utils.dart';
import 'package:volumeter/features/projects/domain/models/project_metadata.dart';
import 'package:volumeter/features/projects/domain/models/project_status.dart';
import 'package:volumeter/features/projects/presentation/widgets/folder_clipper.dart';
import 'package:volumeter/providers/projects_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';

class ProjectCard extends ConsumerStatefulWidget {
  const ProjectCard({super.key, required this.project});

  /// This [ProjectMetadata] used to build the view
  final ProjectMetadata project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard>
    with TickerProviderStateMixin {
  final _attachKey = GlobalKey(debugLabel: 'attachKey');
  final _flyoutController = fluent.FlyoutController();
  late final AnimationController _deleteAnimationController;
  @override
  void initState() {
    super.initState();
    _deleteAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _flyoutController.dispose();
    _deleteAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    final isSelected = ref
        .watch(projectSelectionProvider)
        .contains(widget.project.id);
    return GestureDetector(
      onTap: () => _handleOpen(),
      onDoubleTap: () {
        /// select or deselect the project
        if (isSelected) {
          ref
              .read(projectSelectionProvider.notifier)
              .deselectProject(widget.project.id);
        } else {
          ref
              .read(projectSelectionProvider.notifier)
              .selectProject(widget.project.id);
        }
      },
      onSecondaryTap: () {
        /// Open context Menu
        // This calculates the position of the flyout according to the parent navigator

        _flyoutController.showFlyout(
          barrierColor: Colors.black.withValues(alpha: 0.1),
          autoModeConfiguration: fluent.FlyoutAutoConfiguration(
            preferredMode: fluent.FlyoutPlacementMode.bottomCenter,
          ),
          builder: (context) {
            final localizations = context.localizations;
            return fluent.MenuFlyout(
              items: [
                fluent.MenuFlyoutItem(
                  leading: const Icon(fluent.FluentIcons.open_file),
                  text: Text(localizations.openProject),
                  onPressed: _handleOpen,
                ),
                const fluent.MenuFlyoutSeparator(),
                if (isSelected)
                  fluent.MenuFlyoutItem(
                    leading: const Icon(fluent.FluentIcons.clear_selection),
                    text: Text(localizations.deselect),
                    onPressed: () {
                      ref
                          .read(projectSelectionProvider.notifier)
                          .deselectProject(widget.project.id);
                    },
                  ),
                if (!isSelected)
                  fluent.MenuFlyoutItem(
                    leading: const Icon(fluent.FluentIcons.select_all),
                    text: Text(localizations.select),
                    onPressed: () {
                      ref
                          .read(projectSelectionProvider.notifier)
                          .selectProject(widget.project.id);
                    },
                  ),
                fluent.MenuFlyoutItem(
                  leading: const Icon(fluent.FluentIcons.download),
                  text: Text(localizations.download),
                  onPressed: () {},
                ),
                fluent.MenuFlyoutItem(
                  leading: const Icon(fluent.FluentIcons.delete),
                  text: Text(localizations.delete),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _handleDelete();
                  },
                ),
              ],
            );
          },
        );
      },
      child: ScaleTransition(
        scale: _deleteAnimationController.drive(
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: AnimatedScale(
          scale: isSelected ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Stack(
            children: [
              ClipPath(
                clipper: FolderClipper(),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    side: BorderSide(
                      color: isSelected ? colors.primary : colors.outline,
                      width: isSelected ? 2.0 : 1.0,
                    ),
                  ),
                  child: _buildContent(context, ref),
                ),
              ),
              if (isDesktopWeb)
                fluent.FlyoutTarget(
                  key: _attachKey,
                  controller: _flyoutController,
                  child: _buildMenuButton(context, ref),
                ),
              if (!isDesktopWeb) _buildMenuButton(context, ref),
              Positioned(top: 3, left: 3, child: _buildSelectionBadge(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the main content like title and description
  Widget _buildContent(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: _buildThumbnail(context)),

        /// Footer
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: colors.cardColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.project.name,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    context.localizations.lastUpdateStatus(
                      DateTime.now()
                          .difference(widget.project.updatedAt)
                          .inDays,
                    ),
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  _statusBadge(context),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the menu button for desktop and mobile
  _buildMenuButton(BuildContext context, WidgetRef ref) {
    final colors = ref.read(themeProvider.select((s) => s.colors));
    final isSelected = ref
        .watch(projectSelectionProvider)
        .contains(widget.project.id);
    return Positioned(
      right: isDesktop ? -4 : -5,
      top: isDesktopWeb ? 2 : -5,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(side: BorderSide(color: colors.outline)),
        ),
        onPressed:
            isDesktopWeb
                ? () {
                  /// Desktop onPressed
                  _flyoutController.showFlyout(
                    autoModeConfiguration: fluent.FlyoutAutoConfiguration(
                      preferredMode: fluent.FlyoutPlacementMode.bottomCenter,
                    ),
                    dismissWithEsc: true,
                    navigatorKey: rootNavigatorKey.currentState,
                    barrierDismissible: true,
                    dismissOnPointerMoveAway: false,
                    builder: (context) {
                      final localizations = context.localizations;
                      return fluent.MenuFlyout(
                        items: [
                          fluent.MenuFlyoutItem(
                            leading: const Icon(fluent.FluentIcons.open_file),
                            text: Text(localizations.openProject),
                            onPressed: _handleOpen,
                          ),
                          if (!isSelected)
                            fluent.MenuFlyoutItem(
                              leading: const Icon(
                                fluent.FluentIcons.select_all,
                              ),
                              text: Text(localizations.select),
                              onPressed: () {
                                ref
                                    .read(projectSelectionProvider.notifier)
                                    .selectProject(widget.project.id);
                              },
                            ),
                          if (isSelected)
                            fluent.MenuFlyoutItem(
                              leading: const Icon(
                                fluent.FluentIcons.select_all,
                              ),
                              text: Text(localizations.deselect),
                              onPressed: () {
                                ref
                                    .read(projectSelectionProvider.notifier)
                                    .deselectProject(widget.project.id);
                              },
                            ),
                          fluent.MenuFlyoutItem(
                            leading: const Icon(fluent.FluentIcons.download),
                            text: Text(localizations.download),
                            onPressed: () {},
                          ),
                          fluent.MenuFlyoutItem(
                            leading: const Icon(fluent.FluentIcons.delete),
                            text: Text(localizations.delete),
                            onPressed: () {
                              Navigator.pop(context);
                              _handleDelete();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                : () {
                  /// Mobile and Tablet onPressed
                },
        child:
            isDesktopWeb
                ? const Icon(Icons.more_vert_rounded)
                : PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.open_in_new_rounded),
                          title: Text(context.localizations.openProject),
                          onTap: _handleOpen,
                        ),
                      ),
                      if (!isSelected)
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.check),
                            title: Text(context.localizations.select),
                            onTap: () {
                              Navigator.pop(context);
                              ref
                                  .read(projectSelectionProvider.notifier)
                                  .selectProject(widget.project.id);
                            },
                          ),
                        ),
                      if (isSelected)
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(CupertinoIcons.clear_circled),
                            title: Text(context.localizations.deselect),
                            onTap: () {
                              Navigator.pop(context);
                              ref
                                  .read(projectSelectionProvider.notifier)
                                  .deselectProject(widget.project.id);
                            },
                          ),
                        ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.download_rounded),
                          title: Text(context.localizations.download),
                          onTap: () {},
                        ),
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(CupertinoIcons.delete),
                          title: Text(context.localizations.delete),
                          onTap: () {
                            Navigator.pop(context);
                            _handleDelete();
                          },
                        ),
                      ),
                      PopupMenuItem(
                        child: PopupMenuButton(
                          itemBuilder:
                              (context) => [
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.file_copy_rounded,
                                    ),
                                    title: const Text('PDF'),
                                    onTap: () {},
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: const Icon(CupertinoIcons.doc),
                                    title: const Text('R'),
                                    onTap: () {},
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: const Icon(
                                      CupertinoIcons.archivebox,
                                    ),
                                    title: const Text('zip'),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                          child: ListTile(
                            leading: const SizedBox.shrink(),
                            title: Text(context.localizations.export),
                            trailing: const Icon(Icons.arrow_forward_rounded),
                          ),
                        ),
                      ),
                    ];
                  },
                  child: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return FutureBuilder(
      future: _loadThumbnail(widget.project),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        }
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Container(),
        );
      },
    );
  }

  Future<Image> _loadThumbnail(ProjectMetadata project) async {
    final thumbPath = '${project.path}/thumbnails/project_thumb.jpg';
    final file = File(thumbPath);
    if (!await file.exists()) {
      logger.e('Thumbnail does not exists!');
    }
    final image = Image.file(file, fit: BoxFit.cover);
    return image;
  }

  Widget _buildSelectionBadge(BuildContext contex) {
    final isSelected = ref
        .watch(projectSelectionProvider)
        .contains(widget.project.id);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child:
          isSelected
              ? Container(
                key: const ValueKey('selectionBadge'),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4.0),
                margin: const EdgeInsets.all(8.0),
                child: const Icon(Icons.check, size: 20.0, color: Colors.white),
              )
              : const SizedBox.shrink(),
    );
  }

  void _handleDelete() {
    showDialog(
      context: context,
      builder:
          (context) => AdaptiveDialog(
            title: Text(context.localizations.deleteDialog),
            content: Text(context.localizations.deleteDialogMessage),
            actions: [
              isDesktopWeb
                  ? fluent.Button(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(context.localizations.no),
                  )
                  : OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(context.localizations.no),
                  ),
              isDesktopWeb
                  ? fluent.FilledButton(
                    onPressed: () {
                      ref
                          .read(projectProvider.notifier)
                          .removeProject(widget.project);
                      deleteProjectIO(widget.project);
                      Navigator.pop(context);
                    },

                    child: Text(context.localizations.yes),
                  )
                  : FilledButton(
                    onPressed: () {
                      ref
                          .read(projectProvider.notifier)
                          .removeProject(widget.project);
                      deleteProjectIO(widget.project);
                      Navigator.pop(context);
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(context.localizations.yes),
                  ),
            ],
          ),
    );

    _deleteAnimationController.forward().then((_) {
      _deleteAnimationController.reset();
    });
  }

  /// Builds the status badge for the project
  Widget _statusBadge(fluent.BuildContext context) {
    const Map<ProjectStatus, Color> statusColors = {
      ProjectStatus.pending: Color(0xfff2ebfb),
      ProjectStatus.processing: Color(0xfffcefb4),
      ProjectStatus.completed: Color(0xffd8f3dc),
    };
    const Map<ProjectStatus, Color> statusLabelsColors = {
      ProjectStatus.pending: Color(0xff5a2790),
      ProjectStatus.processing: Color(0xffeb6424),
      ProjectStatus.completed: Color(0xff386641),
    };
    final status = widget.project.status;
    final color = statusColors[status];
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Text(
        status.label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: statusLabelsColors[status],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _handleOpen() {
    projectWorkspaceInit(widget.project, ref);
    router.push('/projects/workspace');
  }
}

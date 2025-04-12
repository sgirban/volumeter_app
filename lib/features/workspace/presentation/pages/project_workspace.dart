import 'package:elastic_drawer/elastic_drawer.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tab_container/tab_container.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/adaptive/widgets/adaptive_dialog.dart';
import 'package:volumeter/core/constants/app_numbers.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/utils/project/assets_utils.dart';
import 'package:volumeter/features/workspace/presentation/panels/desktop_side_pannel.dart';
import 'package:volumeter/features/workspace/presentation/widgets/asset_pannel.dart';
import 'package:volumeter/features/workspace/presentation/widgets/assets_generate_menu.dart';
import 'package:volumeter/features/workspace/presentation/widgets/file_import_zone.dart';
import 'package:volumeter/providers/assets_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

class ProjectWorkspace extends ConsumerStatefulWidget {
  const ProjectWorkspace({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectWorkspaceState();
}

class _ProjectWorkspaceState extends ConsumerState<ProjectWorkspace> {
  bool _isPannelVisible = true;
  bool _hovered = false;
  double? pannelWidth;
  String? renameAsset;
  final controller = ResizableController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCommandBar(context),
        Expanded(child: _buildWorkspace(context)),
      ],
    );
  }

  @override
  initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        try {
          setState(() {
            pannelWidth = controller.sizes.last;
            _isPannelVisible =
                pannelWidth != null && pannelWidth! > kMinLeftPannel;
          });
        } catch (_) {}
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Componet widgets
  Widget _buildCommandBar(BuildContext context) {
    final localizations = context.localizations;
    if (isDesktopWeb) {
      return fluent.CommandBarCard(
        child: fluent.Row(
          children: [
            /// Menu
            fluent.MenuBar(
              items: [
                /// New
                fluent.MenuBarItem(
                  title: localizations.project,
                  items: [
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.add),
                      text: Text(localizations.neww),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.open_file),
                      text: Text(localizations.open),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.import),
                      text: Text(localizations.import),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.export),
                      text: Text(localizations.export),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.settings),
                      text: Text(localizations.settings),
                      onPressed: () {},
                    ),
                  ],
                ),

                /// Edit
                fluent.MenuBarItem(
                  title: localizations.edit,
                  items: [
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.undo),
                      text: Text(localizations.undo),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.redo),
                      text: Text(localizations.redo),
                      onPressed: () {},
                    ),
                  ],
                ),

                /// View
                fluent.MenuBarItem(
                  title: localizations.view,
                  items: [
                    fluent.MenuFlyoutItem(
                      leading: const Icon(
                        fluent.FluentIcons.open_in_new_window,
                      ),
                      text: Text(localizations.k2DWorkspace),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.cube_shape),
                      text: Text(localizations.k3DWorkspace),
                      onPressed: () {},
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.calculator_delta),
                      text: Text(localizations.statisticsView),
                      onPressed: () {},
                    ),
                  ],
                ),

                /// Assets
                fluent.MenuBarItem(
                  title: localizations.assets,
                  items: [
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.import),
                      text: Text(localizations.import),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => AdaptiveDialog(
                                title: Text(context.localizations.import),
                                content: const FileImportZone(),
                                actions: [],
                              ),
                        );
                      },
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.rename),
                      text: Text(localizations.rename),
                      onPressed: () {
                        final project = ref.read(workspaceProvider).project;
                        final selectedID =
                            ref
                                .read(workspaceProvider)
                                .selectedAsset
                                .firstOrNull;
                        if (selectedID == null) return;
                        final selasset = ref
                            .read(assetsProvider.notifier)
                            .getAssetById(selectedID);
                        showDialog(
                          context: context,
                          builder:
                              (context) => AdaptiveDialog(
                                title: Text(context.localizations.rename),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    fluent.TextBox(
                                      placeholder: selasset?.name ?? '',
                                      onChanged: (value) {
                                        renameAsset = value;
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  fluent.Button(
                                    child: Text(localizations.cancel),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  fluent.FilledButton(
                                    child: Text(localizations.rename),
                                    onPressed: () {
                                      final id = ref
                                          .read(assetsProvider.notifier)
                                          .getAssetById(selectedID);
                                      if (id == null) return;
                                      if (renameAsset == null) return;
                                      renameIOAsset(
                                        id,
                                        renameAsset!,
                                        project,
                                      ).then((_) {
                                        ref
                                            .read(assetsProvider.notifier)
                                            .loadAllAssets(project);
                                      });

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.generate),
                      text: Text(localizations.generate),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder:
                              (context) => AdaptiveDialog(
                                title: Text(context.localizations.generate),
                                content: const AssetsGenerateMenu(),
                                actions: [],
                              ),
                        );
                      },
                    ),
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.delete),
                      text: Text(localizations.delete),
                      onPressed: () async {
                        final project = ref.read(workspaceProvider).project;
                        final pid =
                            ref
                                .read(workspaceProvider)
                                .selectedAsset
                                .firstOrNull;
                        if (pid == null) return;
                        final id = ref
                            .read(assetsProvider.notifier)
                            .getAssetById(pid);
                        if (id == null) return;
                        await deleteAsset(id, project);
                        ref
                            .read(assetsProvider.notifier)
                            .loadAllAssets(project);
                      },
                    ),
                  ],
                ),

                /// Help
                fluent.MenuBarItem(
                  title: localizations.help,
                  items: [
                    fluent.MenuFlyoutItem(
                      leading: const Icon(fluent.FluentIcons.info12),
                      text: Text(localizations.documentation),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),
            fluent.FilledButton(
              onPressed: () {},
              style: const fluent.ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
              child: const Text('Process'),
            ),
            const SizedBox(width: 8),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _buildWorkspace(BuildContext context) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    if (isDesktopWeb) {
      return ResizableContainer(
        controller: controller,
        divider: ResizableDivider(
          color: _hovered ? colors.primary : colors.inversePrimary,
          thickness: 3,
          padding: 2,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          length: const ResizableSize.ratio(0.3),
          onHoverEnter: () => setState(() => _hovered = true),
          onHoverExit: () => setState(() => _hovered = false),
        ),
        children: [
          ResizableChild(child: _buildView(context)),
          ResizableChild(
            size:
                _isPannelVisible
                    ? const ResizableSize.ratio(0.3)
                    : const ResizableSize.ratio(0),
            maxSize: 500,
            child: _buildSidePanel(context),
          ),
        ],
        direction: Axis.horizontal,
      );
    }
    return Scaffold(
      body: ElasticDrawer(
        mainColor: Colors.white,
        markWidth: 5,
        markPosition: 0.8,
        drawerColor: const fluent.Color.fromARGB(255, 125, 125, 125),
        mainChild: const Column(children: [Text('MAIN content')]),
        drawerChild: Stack(
          children: [
            fluent.Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  /// Tabs
                  Expanded(
                    child: TabContainer(
                      tabsStart: 0.1,
                      tabsEnd: 0.9,
                      tabExtent: 50,
                      tabMinLength: 100,
                      tabEdge: TabEdge.top,
                      borderRadius: BorderRadius.circular(10),
                      tabBorderRadius: BorderRadius.circular(10),
                      color: colors.surface,
                      childPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 8.0,
                      ),
                      selectedTextStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(fontSize: 15, color: colors.primary),
                      unselectedTextStyle: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontSize: 13),

                      tabs: [
                        Text(context.localizations.assets),
                        Text(context.localizations.toolProperties),
                      ],
                      children: [
                        const AssetPannel(),
                        fluent.Column(
                          children: [Container(child: Text('Child 2'))],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton.outlined(
                tooltip: context.localizations.close,
                onPressed: () {
                  ElasticDrawerKey.drawer.currentState?.closeElasticDrawer(
                    context,
                  );
                },
                icon: const Icon(CupertinoIcons.right_chevron),
              ),
            ),
          ],
        ),
      ),
    );
    //return _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    return Container(color: Colors.red);
  }

  Widget _buildSidePanel(BuildContext context) {
    if (isDesktopWeb) {
      if (_isPannelVisible) {
        return const DesktopSidePannel();
      } else {
        return const SizedBox.shrink();
      }
    }
    return Container();
  }
}

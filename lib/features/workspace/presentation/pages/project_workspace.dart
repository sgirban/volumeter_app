import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/constants/app_numbers.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/workspace/presentation/panels/desktop_side_pannel.dart';
import 'package:volumeter/providers/theme_provider.dart';

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
    return Container();
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

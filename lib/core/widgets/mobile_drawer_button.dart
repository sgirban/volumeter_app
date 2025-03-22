import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/providers/theme_provider.dart';

class MobileDrawerButton extends ConsumerWidget {
  const MobileDrawerButton({super.key, required this.controller});
  final AdvancedDrawerController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.primary,
        overlayColor: colors.outline,
        backgroundColor: colors.surface.withValues(alpha: 0.9),
      ),
      onPressed: () {
        if (controller.value.visible) {
          controller.hideDrawer();
        } else {
          controller.showDrawer();
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Icon(controller.value.visible ? Icons.clear : Icons.menu),
      ),
    );
  }
}

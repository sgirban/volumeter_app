import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/providers/theme_provider.dart';

/// This [Widget] build a card preview of the curent Layout navigation pane set-up.
///
///
class LayoutPreviewWidget extends ConsumerWidget {
  const LayoutPreviewWidget({
    super.key,
    this.mode = fluent.PaneDisplayMode.auto,
  });
  final fluent.PaneDisplayMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    if (mode == fluent.PaneDisplayMode.compact) {
      return Card(
        color: colors.surface,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.cardColor,
                  border: Border(right: BorderSide(color: colors.outline)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 5),
          ],
        ),
      );
    }
    if (mode == fluent.PaneDisplayMode.top) {
      return Card(
        color: colors.surface,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.cardColor,
                  border: Border(bottom: BorderSide(color: colors.outline)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 5),
          ],
        ),
      );
    }
    return Card(
      color: colors.surface,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: colors.cardColor,
                border: Border(right: BorderSide(color: colors.outline)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/widgets/adaptive_icon.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/providers/projects_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';

class BatchProjectActionBar extends ConsumerWidget {
  const BatchProjectActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = context.localizations;
    final selectionCount = ref.watch(projectSelectionProvider).length;
    final textTheme = ref.read(themeProvider.select((s) => s.text));
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 10),

        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeOutQuint,
        ),
      ),
      child: Card(
        elevation: 8.0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations.selectedCount(selectionCount),
                style: textTheme.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16.0),
              Row(
                children: [
                  IconButton(
                    icon: const AdaptiveIcon(
                      desktop: fluent.FluentIcons.delete,
                      android: CupertinoIcons.delete,
                    ),
                    tooltip: localizations.delete,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const AdaptiveIcon(
                      desktop: fluent.FluentIcons.download,
                      android: CupertinoIcons.cloud_download_fill,
                    ),
                    tooltip: localizations.download,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const AdaptiveIcon(
                      desktop: fluent.FluentIcons.clear,
                      android: CupertinoIcons.clear,
                    ),
                    tooltip: localizations.deselect,
                    onPressed: () {
                      ref
                          .read(projectSelectionProvider.notifier)
                          .clearSelection();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

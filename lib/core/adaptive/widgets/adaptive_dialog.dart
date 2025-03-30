import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';

class AdaptiveDialog extends ConsumerWidget {
  const AdaptiveDialog({super.key, this.actions, this.title, this.content});

  final List<Widget>? actions;

  /// Usualy a [Text] widget nicating the dialog title
  final Widget? title;
  final Widget? content;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isDesktopWeb) {
      return fluent.ContentDialog(
        actions: actions,
        title: title,
        content: content,
      );
    }
    return AlertDialog(title: title, content: content, actions: actions);
  }
}

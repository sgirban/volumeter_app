import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/providers/theme_provider.dart';

/// Used to make a Gnome-like style  toggle item for settings
///
/// The component has some title and a description, and uses a toggle button to change its state
class ToggleSettingsItem extends ConsumerWidget {
  const ToggleSettingsItem({
    super.key,
    required this.title,
    this.description,
    this.info,
    required this.value,
    required this.onToggle,
    this.enabled = true,
  });

  /// The tile title. This is displayed in the right.
  ///
  /// It should be short and concise
  final String title;

  /// Optional short description for [ToggleSettingsItem]. It must be brief and short
  ///
  /// Default value is `null`
  final String? description;

  /// A short text that explains what effects does this settings have.
  ///
  /// If not `null` then a small info [Icon] appears with this message as a [Tooltip].
  /// If this value is `null` (as it is by default) then the small info [Icon] is not shown.
  final String? info;

  /// The initial [value] of the toggle switch
  final bool value;

  /// A callback called when the user toggles the switch. The main structure is like this:
  /// ```dart
  ///void  onToggle(bool value){
  /// // the logic goes here .....
  ///}
  /// ```
  final void Function(bool value) onToggle;

  /// Wheter this [Widget] should be `enabled`, and user can interact normally with it, or if the `enabled` is set to `false`
  /// then the interaction becomes impossible.
  ///
  /// Default to `true`
  final bool enabled;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(themeProvider.select((s) => s.text));
    if (!enabled) {
      return ExcludeFocus(
        child: AbsorbPointer(
          child: Opacity(
            opacity: 0.5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  fluent.Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: text.titleSmall),
                        if (description != null)
                          Text(
                            description!,
                            overflow: TextOverflow.fade,
                            style: text.bodyMedium.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 0.7),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (info != null && !isDesktopWeb)
                    Tooltip(
                      message: info,
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  if (info != null && isDesktopWeb)
                    fluent.Tooltip(
                      message: info,
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  if (info != null) const SizedBox(width: 8.0),
                  if (isDesktopWeb)
                    fluent.ToggleSwitch(checked: value, onChanged: onToggle),
                  if (!isDesktopWeb)
                    Switch.adaptive(value: value, onChanged: onToggle),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text.titleSmall),
                if (description != null)
                  Text(
                    description!,
                    overflow: TextOverflow.fade,
                    style: text.bodyMedium.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
              ],
            ),
          ),
          const Spacer(),
          if (info != null && !isDesktopWeb)
            Tooltip(
              message: info,
              child: const Icon(Icons.info_outline_rounded),
            ),
          if (info != null && isDesktopWeb)
            fluent.Tooltip(
              message: info,
              child: const Icon(Icons.info_outline_rounded),
            ),
          if (info != null) const SizedBox(width: 8.0),
          if (isDesktopWeb)
            fluent.ToggleSwitch(checked: value, onChanged: onToggle),
          if (!isDesktopWeb) Switch.adaptive(value: value, onChanged: onToggle),
        ],
      ),
    );
  }
}

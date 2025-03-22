import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

/// Used to make a Gnome-like style to pick an  item for a list a s a setting configuration settings
///
class ComboSettingsItem extends ConsumerWidget {
  const ComboSettingsItem({
    super.key,
    required this.title,
    this.description,
    this.info,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.enabled = true,
  });

  /// The tile title. This is displayed in the right.
  ///
  /// It should be short and concise
  final String title;

  /// Optional short description for [ComboSettingsItem]. It must be brief and short
  ///
  /// Default value is `null`
  final String? description;

  /// A short text that explains what effects does this settings have.
  ///
  /// If not `null` then a small info [Icon] appears with this message as a [Tooltip].
  /// If this value is `null` (as it is by default) then the small info [Icon] is not shown.
  final String? info;

  /// Wheter this [Widget] should be `enabled`, and user can interact normally with it, or if the `enabled` is set to `false`
  /// then the interaction becomes impossible.
  ///
  /// Default to `true`
  final bool enabled;

  /// A list of [String] items that is used to build upp the ComboBox
  ///
  /// Each element from the [items] is mapped to a [DropdownMenuItem] using [items] as individual values
  ///
  final List<String> items;

  /// This is the selected value which also initializes the Combo.
  final String selectedValue;

  /// This callbacked, called when another combo it is picked. You should imediatly update this [selectedValue]
  /// in order to see the changes made.
  ///
  /// For example
  /// ```dart
  /// void onChanged(String? value){
  /// //your logic goes here
  /// }
  /// ```
  final void Function(String? value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(themeProvider.select((s) => s.text));
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    final newItems =
        items
            .map(
              (String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                  style: text.bodyMedium.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            )
            .toList();
    if (!enabled) {
      return ExcludeFocus(
        child: AbsorbPointer(
          child: Opacity(
            opacity: 0.5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: text.titleSmall),
                      if (description != null)
                        Text(
                          description!,
                          style: text.bodyMedium.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                    ],
                  ),
                  const Spacer(),
                  if (info != null && !isDesktop)
                    Tooltip(
                      message: info,
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  if (info != null && isDesktop)
                    fluent.Tooltip(
                      message: info,
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  if (info != null) const SizedBox(width: 8.0),
                  if (isDesktopWeb)
                    fluent.ComboBox<String>(
                      onChanged: onChanged,
                      value: selectedValue,
                      items:
                          items
                              .map(
                                (String item) => fluent.ComboBoxItem<String>(
                                  value: item,
                                  child: fluent.Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    child: Text(item),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  if (!isDesktopWeb)
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        items: newItems,
                        value: selectedValue,
                        onChanged: onChanged,
                        buttonStyleData: ButtonStyleData(
                          height: 40,
                          width: 150,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.black26),
                            color: colors.background,
                          ),
                          elevation: 0,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          iconSize: 14,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: colors.background,
                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: WidgetStateProperty.all(6),
                            thumbVisibility: WidgetStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
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
          fluent.Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: text.titleSmall),
                if (description != null)
                  Text(
                    description!,
                    overflow: TextOverflow.ellipsis,
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
          if (info != null && !isDesktop)
            Tooltip(
              message: info,
              child: const Icon(Icons.info_outline_rounded),
            ),
          if (info != null && isDesktop)
            fluent.Tooltip(
              message: info,
              child: const Icon(Icons.info_outline_rounded),
            ),
          if (info != null) const SizedBox(width: 8.0),
          if (isDesktopWeb)
            fluent.ComboBox<String>(
              onChanged: onChanged,
              value: selectedValue,
              items:
                  items
                      .map(
                        (String item) => fluent.ComboBoxItem<String>(
                          value: item,
                          child: fluent.Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: Text(item),
                          ),
                        ),
                      )
                      .toList(),
            ),
          if (!isDesktopWeb)
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                items: newItems,
                value: selectedValue,
                onChanged: onChanged,
                buttonStyleData: ButtonStyleData(
                  height: 40,
                  width: 150,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black26),
                    color: colors.background,
                  ),
                  elevation: 0,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                  iconSize: 14,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colors.background,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(6),
                    thumbVisibility: WidgetStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

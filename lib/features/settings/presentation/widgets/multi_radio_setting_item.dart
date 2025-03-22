import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/features/settings/domain/models/settings_item_multiradio.dart';
import 'package:volumeter/providers/theme_provider.dart';

/// Used to make a Gnome-like style multi select with preview item
///
/// The component has some title and a description, and then prints a [Scrollable] list of items
///  which user can pick from.
class MultiRadioSettingItem extends ConsumerWidget {
  const MultiRadioSettingItem({
    super.key,
    required this.title,
    required this.items,
    required this.selectedValue,
    this.height = 250,
    required this.onChanged,
    this.rounded = true,
  });

  /// Uses the [SettingsItemMultiradio] to print them in a [Scrollable] list.
  ///
  final List<SettingsItemMultiradio> items;

  /// The [title] of this section item. It should be a short tile sumarrizing the section behavior
  final String title;

  /// This [selectedValue] is used to determin which item is selected and update the ui acordigly.
  /// Note that in order to see the changes in the ui, the [selectedValue] must be equal to one of
  /// the [items].title. Otherwise none of the items would appear selected
  final String selectedValue;

  /// The [height] in logical pixels. Adjust in it also forces the hild to scale up
  ///
  /// The default value is `250`
  /// ```dart
  /// final double height  = 250;
  /// ```
  final double height;

  /// If set to true, then the border becomes much more rounded
  ///
  /// Default to `true`
  final bool rounded;

  /// This callback, called when the user taps on child [Widget] or when user press the radio.
  /// Then the [onChanged] is called with this value property of the [SettingsItemMultiradio].
  ///
  /// ```dart
  /// void onChanged(String value){
  ///   // the logic goes here....
  /// }
  /// ```
  final void Function(String value) onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(themeProvider.select((s) => s.text));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: text.titleMedium.copyWith(fontWeight: FontWeight.w500),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: height),
                  child: Center(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final bool isSelected =
                            items[index].value == selectedValue;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: GestureDetector(
                                    onTap: () {
                                      onChanged.call(items[index].value);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border:
                                            isSelected
                                                ? Border.all(
                                                  color: const Color(
                                                    0xff337DE8,
                                                  ),
                                                  width: 2,
                                                )
                                                : null,
                                        borderRadius:
                                            rounded
                                                ? const BorderRadius.all(
                                                  Radius.circular(12),
                                                )
                                                : null,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                rounded
                                                    ? const BorderRadius.all(
                                                      Radius.circular(12),
                                                    )
                                                    : null,
                                            color: const Color(0xffeaeaea),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: items[index].child,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: isSelected,
                                    groupValue: true,
                                    onChanged: (value) {
                                      onChanged.call(items[index].value);
                                    },
                                  ),
                                  Text(
                                    items[index].title,
                                    style: text.bodyLarge,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

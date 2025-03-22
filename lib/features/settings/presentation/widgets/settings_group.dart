import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/providers/theme_provider.dart';

/// The [SettingsGroup] is a Widget used to group logicaly and visualy the different types of settings.
/// It crates a simple description and builds a [Card] with a list of [Widget] representing the configurations
class SettingsGroup extends ConsumerWidget {
  const SettingsGroup({
    super.key,
    required this.title,
    this.description,
    required this.children,
  });

  /// A [String] representing the grouping name.
  ///
  /// It is usually displayed in the top with left alignment, and is usually folowed by an optional [description]
  ///
  /// An example could be `Theme` or `Fonts`
  final String title;

  /// A [String] representing a short description that shortly explains what this [SettingsGroup] category is for.
  ///
  /// Usualy it prints the text under the [title]. If `null` nothing is displayed
  final String? description;

  /// A list of [Widget] represeting settings. Each [Widget] from the list is then maped and carefuly arranged iside the [SettingsGroup].
  ///
  /// Altough any widget can be used, it is preffered to use one of the specialized widgets for that.
  ///
  /// Main Widgets build specificaly for that are:
  /// - ToggleSettingsItem
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(themeProvider.select((s) => s.text));
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    if (children.isEmpty) return Container();
    return Padding(
      padding:
          context.mobileLayout
              ? const EdgeInsets.symmetric(horizontal: 8.0)
              : const EdgeInsets.symmetric(horizontal: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: text.headlineSmall.copyWith(fontSize: 20),
            ),
          ),
          if (description != null) const SizedBox(height: 10),
          if (description != null) Text(description!, style: text.bodyMedium),

          // SettingsGroup Card
          Card(
            color: colors.cardColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: colors.outline, width: 0.4),
            ),
            child: Column(
              children:
                  children
                      .expand(
                        (widget) => [
                          widget,
                          Container(
                            color: colors.outline,
                            height: 0.4,
                            width: double.maxFinite,
                          ),
                        ],
                      )
                      .toList()
                    ..removeLast(),
            ),
          ),
        ],
      ),
    );
  }
}

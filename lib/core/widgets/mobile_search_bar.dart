import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/constants/search_items.dart';
import 'package:volumeter/core/constants/sizes.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/providers/theme_provider.dart';

class MobileSearchBar extends ConsumerStatefulWidget {
  const MobileSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileSearchBarState();
}

class _MobileSearchBarState extends ConsumerState<MobileSearchBar> {
  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return SearchAnchor(
      viewBackgroundColor: colors.colorScheme.surfaceContainer,

      builder: (BuildContext context, SearchController controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: const BorderRadius.all(Radius.circular(lround)),
            border: Border.all(color: colors.outline),
          ),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 8.0),
              Text(
                context.localizations.search,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        );
      },
      suggestionsBuilder: (
        BuildContext context,
        SearchController controller,
      ) async {
        final searchItems =
            context.localizations.localeName == 'ro'
                ? roSearchItems
                : enSearchItems;
        final searchedText = controller.text;
        final finalItems =
            searchItems
                .where(
                  (item) => item.label.toLowerCase().contains(
                    searchedText.toLowerCase(),
                  ),
                )
                .map((element) => element.toListTile(controller))
                .toList();
        return finalItems;
      },
    );
  }
}

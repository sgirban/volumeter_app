import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/constants/navigation_items.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/widgets/mobile_search_bar.dart';
import 'package:volumeter/providers/theme_provider.dart';

class MobileNavigationView extends ConsumerStatefulWidget {
  const MobileNavigationView({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileNavigationViewState();
}

class _MobileNavigationViewState extends ConsumerState<MobileNavigationView> {
  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    var items =
        context.localizations.localeName == 'ro'
            ? roNavItems.map((e) => e.tileItem).toList()
            : navItems.map((e) => e.tileItem).toList();
    var subitems =
        context.localizations.localeName == 'ro'
            ? roNavFootItems.map((e) => e.tileItem).toList()
            : navFootItems.map((e) => e.tileItem).toList();
    if (widget.selectedIndex < items.length) {
      final tile = items[widget.selectedIndex];
      items[widget.selectedIndex] = ListTile(
        selectedTileColor: colors.primary,
        leading: tile.leading,
        title: tile.title,
        trailing: tile.trailing,
        onTap: tile.onTap,
        shape: tile.shape,
        selected: true,
      );
    } else if (widget.selectedIndex < items.length + subitems.length) {
      final tile = subitems[widget.selectedIndex - items.length];
      subitems[widget.selectedIndex - items.length] = ListTile(
        leading: tile.leading,
        title: tile.title,
        trailing: tile.trailing,
        shape: tile.shape,
        onTap: tile.onTap,
        selected: true,
      );
    }
    return SafeArea(
      child: ListTileTheme(
        textColor: colors.onSurface,
        iconColor: colors.onSurface,
        selectedTileColor: colors.primary,
        selectedColor: colors.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128,
                height: 128,
                margin: const EdgeInsets.only(top: 24, bottom: 64),
                child: Image.asset(
                  'assets/icons/launcher/default_logo.png',
                  cacheWidth: 256,
                  cacheHeight: 256,
                ),
              ),
              const MobileSearchBar(),
              const SizedBox(height: 8.0),
              ...items.map(
                (i) => Container(
                  decoration:
                      i.selected
                          ? BoxDecoration(
                            color: colors.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          )
                          : null,
                  child: i,
                ),
              ),
              const Spacer(),
              ...subitems.map(
                (i) => Container(
                  decoration:
                      i.selected
                          ? BoxDecoration(
                            color: colors.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          )
                          : null,
                  child: i,
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

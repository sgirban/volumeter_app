import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart%20' show kIsWeb;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/constants/app_naming.dart';
import 'package:volumeter/core/constants/navigation_items.dart';
import 'package:volumeter/core/constants/search_items.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/routes/router.dart';
import 'package:volumeter/core/widgets/language_switcher_button.dart';
import 'package:volumeter/core/widgets/theme_switcher_button.dart';
import 'package:volumeter/core/widgets/windows_buttons.dart';
import 'package:volumeter/providers/ui_settings_provider.dart';
import 'package:window_manager/window_manager.dart';

class DesktopMainPage extends ConsumerStatefulWidget {
  const DesktopMainPage({
    super.key,
    required this.child,
    required this.shellContext,
  });
  // Shell child
  final Widget child;
  // Shell context
  final BuildContext? shellContext;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopMainPageState();
}

class _DesktopMainPageState extends ConsumerState<DesktopMainPage>
    with WindowListener {
  final viewKey = GlobalKey(debugLabel: 'Navigation View Key');
  final searchKey = GlobalKey(debugLabel: 'Search bar key');
  final searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int indexMain = navItems
        .where((item) => item.key != null)
        .toList()
        .indexWhere((item) => item.key == Key(location));

    if (indexMain == -1) {
      int indexFooter = navFootItems
          .where((element) => element.key != null)
          .toList()
          .indexWhere((element) => element.key == Key(location));
      if (indexFooter == -1) {
        if (location.contains('/settings/')) {
          return navItems
              .where((element) => element.key != null)
              .toList()
              .length;
        }
        return 0;
      }
      return navItems.where((element) => element.key != null).toList().length +
          indexFooter;
    }
    return indexMain;
  }

  PaneDisplayMode _getPaneDisplayMode(String paneMode) {
    switch (paneMode) {
      case 'auto':
        return PaneDisplayMode.auto;
      case 'compact':
        return PaneDisplayMode.compact;
      case 'minimal':
        return PaneDisplayMode.minimal;
      case 'open':
        return PaneDisplayMode.open;
      case 'top':
        return PaneDisplayMode.top;
      default:
        return PaneDisplayMode.auto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.localizations;
    if (widget.shellContext != null) {
      if (router.canPop() == false) {
        setState(() {});
      }
    }
    final paneModeString = ref.watch(
      uiSettingsProvider.select((s) => s.paneMode),
    );
    final enableThemeSwitchButton = ref.watch(
      uiSettingsProvider.select((s) => s.enableThemeSwitchButton),
    );
    final enableLanguageButton = ref.watch(
      uiSettingsProvider.select((s) => s.enableLanguageSwitchButton),
    );
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        leading: () {
          final enabled = widget.shellContext != null && router.canPop();
          final onPressed =
              enabled
                  ? () {
                    if (router.canPop()) {
                      context.pop();
                      setState(() {});
                    }
                  }
                  : null;
          return NavigationPaneTheme(
            data: NavigationPaneTheme.of(context).merge(
              NavigationPaneThemeData(
                unselectedIconColor: WidgetStateProperty.resolveWith((states) {
                  if (states.isDisabled) {
                    return ButtonThemeData.buttonColor(context, states);
                  }
                  return ButtonThemeData.uncheckedInputColor(
                    FluentTheme.of(context),
                    states,
                  ).basedOnLuminance();
                }),
              ),
            ),
            child: Builder(
              builder:
                  (context) => PaneItem(
                    icon: const Center(
                      child: Icon(FluentIcons.back, size: 12.0),
                    ),
                    title: Text(locale.back),
                    body: const SizedBox.shrink(),
                    enabled: enabled,
                  ).build(
                    context,
                    false,
                    onPressed,
                    displayMode: PaneDisplayMode.compact,
                  ),
            ),
          );
        }(),
        title: () {
          if (kIsWeb) {
            return const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(appTitle),
            );
          }
          return const DragToMoveArea(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(appTitle),
            ),
          );
        }(),
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (enableLanguageButton) const LanguageSwitcherButton(),
            if (enableLanguageButton && enableThemeSwitchButton)
              const SizedBox(width: 10.0),
            if (enableThemeSwitchButton) const ThemeSwitcherButton(),
            if (isDesktop) const WindowsButtons(),
          ],
        ),
      ),
      paneBodyBuilder: (item, body) {
        final name =
            item?.key is ValueKey ? (item!.key as ValueKey).value : null;
        return FocusTraversalGroup(
          key: ValueKey('body$name'),
          child: widget.child,
        );
      },
      pane: NavigationPane(
        selected: _calculateSelectedIndex(context),

        /// Header
        ///
        ///
        header: const SizedBox(
          height: 2 * kOneLineTileHeight,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/icons/launcher/default_logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        displayMode: _getPaneDisplayMode(paneModeString),
        indicator: const StickyNavigationIndicator(),
        items:
            locale.localeName == 'ro'
                ? roNavItems.map((e) => e.paneItem).toList()
                : navItems.map((e) => e.paneItem).toList(),
        autoSuggestBox: Builder(
          builder: (context) {
            return AutoSuggestBox(
              key: searchKey,
              focusNode: searchFocusNode,
              controller: searchController,
              unfocusedColor: Colors.transparent,
              items:
                  context.localizations.localeName == 'ro'
                      ? roSearchItems
                          .map(
                            (e) => e.toAutoSuggestBoxItem(
                              searchController,
                              searchFocusNode,
                            ),
                          )
                          .toList()
                      : enSearchItems
                          .map(
                            (e) => e.toAutoSuggestBoxItem(
                              searchController,
                              searchFocusNode,
                            ),
                          )
                          .toList(),
              trailingIcon: IgnorePointer(
                child: IconButton(
                  icon: const Icon(FluentIcons.search),
                  onPressed: () {},
                ),
              ),

              placeholder: locale.search,
            );
          },
        ),
        autoSuggestBoxReplacement: const Icon(FluentIcons.search),
        footerItems:
            locale.localeName == 'ro'
                ? roNavFootItems.map((e) => e.paneItem).toList()
                : navFootItems.map((e) => e.paneItem).toList(),
      ),
      onOpenSearch: searchFocusNode.requestFocus,
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose && mounted) {
      showDialog(
        context: context,
        builder: (_) {
          final locale = context.localizations;
          return ContentDialog(
            title: Text(locale.confirmClose),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(locale.confirmCloseMessage),
            ),
            actions: [
              Button(
                child: Text(locale.no),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
                child: Text(locale.yes),
              ),
            ],
          );
        },
      );
    }
  }
}

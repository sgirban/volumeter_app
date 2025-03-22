import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:volumeter/core/constants/navigation_items.dart';
import 'package:volumeter/core/widgets/mobile_drawer_button.dart';
import 'package:volumeter/core/widgets/mobile_navigation_view.dart';
import 'package:volumeter/providers/theme_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key, required this.child, required this.shellContext});
  // Shell child
  final Widget child;
  // Shell context
  final BuildContext? shellContext;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final viewKey = GlobalKey(debugLabel: 'Navigation View Key');
  final searchKey = GlobalKey(debugLabel: 'Search bar key');
  final drawerController = AdvancedDrawerController();
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    searchController.dispose();
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

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return AdvancedDrawer(
      /// Backdrop (i.e. the background for the drawer)
      ///
      /// The background color should be picked based on the theme color
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.background,
              const Color.fromARGB(46, 172, 188, 204),
            ],
          ),
        ),
      ),
      controller: drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,

      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      // Drawer
      //
      drawer: MobileNavigationView(
        key: viewKey,
        selectedIndex: _calculateSelectedIndex(context),
      ),

      /// Child
      ///
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              widget.child,
              Positioned(
                top: 16,
                left: 16,
                child: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: drawerController,
                  builder: (_, value, __) {
                    return MobileDrawerButton(controller: drawerController);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

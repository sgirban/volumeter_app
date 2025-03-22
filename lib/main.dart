import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:volumeter/core/adaptive/adaptors/desktop_drag_behaviour.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/constants/app_naming.dart';
import 'package:volumeter/core/routes/router.dart';
import 'package:volumeter/core/utils/async_initializers.dart';
import 'package:volumeter/l10n/generated/app_localizations.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/providers/ui_settings_provider.dart';

void main() async {
  initializeApp();
  await initializeHive();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final localeProv = ref.watch(uiSettingsProvider.select((s) => s.locale));

    /// Fluent UI desktop app
    if (isDesktopWeb) {
      return fluent.FluentApp.router(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: theme.fluentThemeData,
        locale: Locale(localeProv),
        builder: (context, child) {
          return fluent.NavigationPaneTheme(
            data: theme.fluentThemeData.navigationPaneTheme,
            child: child!,
          );
        },
        // scrollBehavior: DesktopDragBehaviour(),
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      );
    }

    /// General app
    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme.themeData,
      locale: Locale(localeProv),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}

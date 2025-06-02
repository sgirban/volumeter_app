import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/routes/desktop_main_page.dart';
import 'package:volumeter/core/routes/main_page.dart';
import 'package:volumeter/features/home/presentation/pages/home_page.dart';
import 'package:volumeter/features/projects/presentation/pages/projects_page.dart';
import 'package:volumeter/features/settings/presentation/pages/settings_appearance.dart';
import 'package:volumeter/features/settings/presentation/pages/settings_page.dart';
import 'package:volumeter/features/settings/presentation/pages/settings_server.dart';
import 'package:volumeter/features/workspace/presentation/pages/processing_page.dart';
import 'package:volumeter/features/workspace/presentation/pages/project_workspace.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        /// Desktop Main Page
        if (isDesktopWeb) {
          return DesktopMainPage(
            shellContext: _shellNavigatorKey.currentContext,
            child: child,
          );
        }

        /// General Main Page
        return MainPage(
          shellContext: _shellNavigatorKey.currentContext,
          child: child,
        );
      },
      routes: <GoRoute>[
        /// Home
        GoRoute(path: '/', builder: (context, state) => const HomePage()),

        /// Projects
        GoRoute(
          path: '/projects',
          builder: (context, state) => const ProjectsPage(),
          routes: <GoRoute>[
            GoRoute(
              path: 'workspace',
              builder: (context, state) => const ProjectWorkspace(),
              routes: <GoRoute>[
                GoRoute(
                  path: 'processing',
                  builder: (contex, state) => const ProcessingPage(),
                ),
              ],
            ),
          ],
        ),

        /// Settings
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsPage(),
          routes: <GoRoute>[
            GoRoute(
              path: 'appearance',
              builder: (context, state) {
                final fragment = state.uri.fragment;
                return SettingsAppearance(
                  scrollToSection: fragment.isNotEmpty ? fragment : null,
                );
              },
            ),
            GoRoute(
              path: 'server',
              builder: (context, state) => const SettingsServer(),
            ),
          ],
        ),
      ],
    ),
  ],
);

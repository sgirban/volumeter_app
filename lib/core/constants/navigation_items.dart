import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:volumeter/core/adaptive/adaptors/navigation_item.dart';
import 'package:volumeter/core/adaptive/widgets/adaptive_icon.dart';

const navItems = [
  NavigationItem(
    key: ValueKey('/'),
    icon: AdaptiveIcon(desktop: fluent.FluentIcons.home, android: Icons.home),
    title: Text('Home'),
    body: SizedBox.shrink(),
  ),
  NavigationItem(
    key: ValueKey('/projects'),
    icon: AdaptiveIcon(
      desktop: fluent.FluentIcons.project_collection,
      android: Icons.folder,
    ),
    title: Text('Projects'),
    body: SizedBox.shrink(),
  ),
];
const roNavItems = [
  NavigationItem(
    key: ValueKey('/'),
    icon: AdaptiveIcon(desktop: fluent.FluentIcons.home, android: Icons.home),
    title: Text('Acasă'),
    body: SizedBox.shrink(),
  ),
  NavigationItem(
    key: ValueKey('/projects'),
    icon: AdaptiveIcon(
      desktop: fluent.FluentIcons.project_collection,
      android: Icons.folder,
    ),
    title: Text('Projects'),
    body: SizedBox.shrink(),
  ),
];

const navFootItems = [
  NavigationItem(
    key: ValueKey('/settings'),
    icon: AdaptiveIcon(
      desktop: fluent.FluentIcons.settings,
      android: CupertinoIcons.settings_solid,
    ),
    title: Text('Settings'),
    body: SizedBox.shrink(),
  ),
];
const roNavFootItems = [
  NavigationItem(
    key: ValueKey('/settings'),
    icon: AdaptiveIcon(
      desktop: fluent.FluentIcons.settings,
      android: CupertinoIcons.settings_solid,
    ),
    title: Text('Setări'),
    body: SizedBox.shrink(),
  ),
];

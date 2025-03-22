import 'package:fluent_ui/fluent_ui.dart' as fluent show PaneItem;
import 'package:flutter/material.dart';
import 'package:volumeter/core/routes/router.dart';

class NavigationItem {
  final Key? key;

  /// Usualy a [Text] Widget
  final Widget? title;

  /// Icon used to display
  ///
  /// Usualy an [Icon] Widget
  final Widget icon;

  /// Info badge printed by this item
  final Widget? infoBadge;

  /// An optional widget placed in the right side
  ///
  /// Usually an [Icon] widget
  final Widget? trailing;

  /// The body of the view attached to this tab
  final Widget body;

  /// The funtion called when the item is pressed
  final VoidCallback? onTap;

  const NavigationItem({
    this.key,
    this.title,
    required this.icon,
    this.infoBadge,
    this.trailing,
    required this.body,
    this.onTap,
  });

  fluent.PaneItem get paneItem {
    return fluent.PaneItem(
      key: key,
      title: title,
      icon: icon,
      trailing: trailing,
      body: body,
      infoBadge: infoBadge,
      onTap: () {
        final path = (key as ValueKey).value;
        if (router.state.uri.toString() != path) {
          router.go(path);
        }
        onTap?.call();
      },
    );
  }

  ListTile get tileItem {
    return ListTile(
      key: key,
      leading: icon,
      title: title,
      trailing: trailing,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      onTap: () {
        final path = (key as ValueKey).value;
        if (router.state.uri.toString() != path) {
          router.go(path);
        }
        onTap?.call();
      },
    );
  }
}

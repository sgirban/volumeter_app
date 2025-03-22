import 'package:flutter/widgets.dart';

class SettingsCategory {
  /// This [id] is used for navigating to the appropriate page
  ///
  /// For example if
  ///```dart
  /// id='appearance';
  ///```
  /// then router calls:
  ///```dart
  /// router.go('settings/appearance');
  ///```
  ///
  /// If the path `settings/id` does not exits then `GoRouterException` will occur
  final String id;

  /// Text displayed for the category
  ///
  /// For example `Appearance`
  final String title;

  /// Short keywords used in combination with  [title]
  final String subtitle;

  /// A related Icon to the [title]
  final IconData icon;

  SettingsCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

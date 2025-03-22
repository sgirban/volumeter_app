import 'package:flutter/widgets.dart';

/// This is used as a warper class
///
///
class SettingsItemMultiradio<T> {
  const SettingsItemMultiradio({
    required this.title,
    required this.value,
    required this.child,
  });

  /// This [title] is used to print the underneath text under the tile section
  ///
  /// It is preferable to not be very long
  final String title;

  /// This [value] is of any type [T], and it it used to compare ojects and it is also
  /// used to determine if this object is selected or not
  final T value;

  /// This [child] it is actually the widget that would be placed inside the main widget
  ///
  ///
  final Widget child;
}

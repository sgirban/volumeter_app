import 'package:flutter/material.dart';
import 'package:volumeter/l10n/generated/app_localizations.dart';

extension ResponsiveExtensions on BuildContext {
  bool get mobileLayout => MediaQuery.sizeOf(this).width <= 600;
  bool get desktopLayout => MediaQuery.sizeOf(this).width > 600;
  bool get tabletLayout =>
      !mobileLayout && MediaQuery.sizeOf(this).width <= 900;

  AppLocalizations get localizations => AppLocalizations.of(this)!;
}

import 'package:fluent_ui/fluent_ui.dart'
    as fluent
    show
        ColorExtension,
        FluentThemeData,
        FocusThemeData,
        NavigationPaneThemeData;
import 'package:flutter/material.dart'
    show
        CardTheme,
        CardThemeData,
        ElevatedButton,
        ElevatedButtonThemeData,
        InputDecorationTheme,
        OutlineInputBorder,
        ThemeData;
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volumeter/core/theme/app_colors.dart';
import 'package:volumeter/core/theme/app_text.dart';
import 'package:volumeter/core/theme/theme_utils.dart';
import 'package:volumeter/core/utils/settings/ui_settings.dart';
part 'volumeter_theme.freezed.dart';

@freezed
abstract class VolumeterTheme with _$VolumeterTheme {
  const VolumeterTheme._();
  const factory VolumeterTheme({
    required AppColors colors,
    required AppText text,
  }) = _VolumeterTheme;

  // factory main constructor
  factory VolumeterTheme.fromSettings(UiSettings settings) {
    final colorScheme = getColorsFromTheme(settings.currentTheme).colorScheme;
    return VolumeterTheme(
      colors: getColorsFromTheme(settings.currentTheme),
      text: AppText.generateFrom(
        primaryFont: settings.primaryFont,
        secondaryFont: settings.secondary,
        colors: colorScheme,
      ),
    );
  }

  ThemeData get themeData => ThemeData(
    brightness: colors.brightness,
    colorScheme: colors.colorScheme,
    cardTheme: CardTheme(
      data: CardThemeData(
        color: colors.surfaceVariant,
        elevation: 0.7,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
    focusColor: colors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colors.onPrimary,
        backgroundColor: colors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: colors.outline),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textTheme: text.textTheme,
    useMaterial3: true,
  );
  fluent.FluentThemeData get fluentThemeData => fluent.FluentThemeData(
    brightness: colors.brightness,
    cardColor: colors.surfaceVariant,
    fontFamily: text.primaryFont,
    focusTheme: fluent.FocusThemeData(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      primaryBorder: BorderSide(color: colors.primary),
      secondaryBorder: BorderSide(color: colors.primary),
    ),
    scaffoldBackgroundColor: colors.surface,
    accentColor: colors.primary.toAccentColor(),
    navigationPaneTheme: fluent.NavigationPaneThemeData(
      backgroundColor: colors.navpane,
      selectedIconColor: WidgetStatePropertyAll(colors.primary),
      selectedTextStyle: WidgetStatePropertyAll(
        TextStyle(color: colors.primary),
      ),
    ),
  );
}

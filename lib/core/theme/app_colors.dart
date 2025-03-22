import 'package:flutter/material.dart'
    show Brightness, Color, ColorScheme, Colors;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_colors.freezed.dart';

@freezed
abstract class AppColors with _$AppColors {
  const AppColors._();
  const factory AppColors({
    required Brightness brightness,
    // Core colors
    required Color primary,
    required Color onPrimary,
    required Color primaryContainer,
    required Color secondary,
    required Color onSecondary,
    required Color secondaryContainer,
    required Color tertiary,
    required Color onTertiary,
    required Color tertiaryContainer,
    // Background & Surfaces
    required Color surface,
    required Color onSurface,
    required Color surfaceVariant,
    required Color background,
    // Error
    required Color error,
    // Additional
    required Color navpane,
    required Color outline,
    required Color cardColor,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    // Inverse
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? softBlue,
  }) = _AppColors;

  /// Atom Light
  factory AppColors.atomLight() {
    return const AppColors(
      brightness: Brightness.light,
      // Core colors
      primary: Color(0xff2560EB),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD6E3FF),
      secondary: Color(0xFF1A3C9E),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xffC9D7F8),
      tertiary: Color(0xff5EC8FC), // Coral 0xff7F6C5E
      onTertiary: Color(0xFF0A1D3A),
      tertiaryContainer: Color(0xFFB8E5FF),
      // Background & Surface
      surface: Color(0xffF3F6FB),
      onSurface: Color(0xff1A1C1E),
      background: Color(0xFFF8F9FA),
      surfaceVariant: Color(0xFFEFF3F6),
      // error
      error: Color(0xFFE53935),
      // Aditional
      navpane: Color(0xffecf3fb),
      cardColor: Color(0xfffafafa),
      outline: Color(0xFFB0C6D9),
      outlineVariant: Color(0xFFD3E0EA),
      shadow: Color(0x40000000),
      scrim: Color(0x73000000),
      // Inverse
      inverseSurface: Color(0xFF2D2F33),
      onInverseSurface: Color(0xFFF5F7FA),
      inversePrimary: Color(0xFFABC7FF),
      softBlue: Color(0xff007FFF),
    );
  }
  factory AppColors.atomDark() {
    return const AppColors(
      brightness: Brightness.dark,
      // Core colors
      primary: Color(0xff0460FF),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD6E3FF),
      secondary: Color(0xFF1A3C9E),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xffC9D7F8),
      tertiary: Color(0xff5EC8FC), // Coral 0xff7F6C5E
      onTertiary: Color(0xFF0A1D3A),
      tertiaryContainer: Color(0xFFB8E5FF),
      // Background & Surface
      surface: Color(0xff1A1E44),
      onSurface: Color(0xffffffff),
      background: Color(0xFF17193F),
      surfaceVariant: Color(0xFF181A3F),
      // error
      error: Color(0xFFE53935),
      // Aditional
      navpane: Color(0xff131231),
      outline: Color(0xFFB0C6D9),
      cardColor: Color(0xff131231),
      softBlue: Color(0xff007FFF),
      outlineVariant: Color(0xFFD3E0EA),
      shadow: Color(0x40000000),
      scrim: Color(0x73000000),

      // Inverse
      inversePrimary: Color(0xFFABC7FF),
    );
  }
  factory AppColors.midnight() {
    return const AppColors(
      brightness: Brightness.dark,
      // Core colors
      primary: Color(0xff2560EB),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD6E3FF),
      secondary: Color(0xFF1A3C9E),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xffC9D7F8),
      tertiary: Color(0xff5EC8FC), // Coral 0xff7F6C5E
      onTertiary: Color(0xFF0A1D3A),
      tertiaryContainer: Color(0xFFB8E5FF),
      // Background & Surface
      surface: Color(0xffF3F6FB),
      onSurface: Color(0xff1A1C1E),
      background: Color(0xFFF8F9FA),
      surfaceVariant: Color(0xFFEFF3F6),
      // error
      error: Color(0xFFE53935),
      // Aditional
      navpane: Color(0xffecf3fb),
      cardColor: Color(0xffeaeaea),
      outline: Color(0xFFB0C6D9),
      outlineVariant: Color(0xFFD3E0EA),
      shadow: Color(0x40000000),
      scrim: Color(0x73000000),
      // Inverse
      inverseSurface: Color(0xFF2D2F33),
      onInverseSurface: Color(0xFFF5F7FA),
      inversePrimary: Color(0xFFABC7FF),
    );
  }
  ColorScheme get colorScheme {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      error: error,
      onError: Colors.white,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      surfaceBright: cardColor,
      inverseSurface: inverseSurface,
      inversePrimary: inversePrimary,
      onInverseSurface: onInverseSurface,
    );
  }
}

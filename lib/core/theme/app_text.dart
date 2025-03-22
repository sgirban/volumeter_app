import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_text.freezed.dart';

@freezed
abstract class AppText with _$AppText {
  const AppText._();
  const factory AppText({
    required String primaryFont,
    required String secondaryFont,
    required TextStyle displayLarge,
    required TextStyle displayMedium,
    required TextStyle displaySmall,
    required TextStyle headlineLarge,
    required TextStyle headlineMedium,
    required TextStyle headlineSmall,
    required TextStyle titleLarge,
    required TextStyle titleMedium,
    required TextStyle titleSmall,
    required TextStyle bodyLarge,
    required TextStyle bodyMedium,
    required TextStyle bodySmall,
    required TextStyle labelLarge,
    required TextStyle labelMedium,
    required TextStyle labelSmall,
    required TextStyle metricLarge,
    required TextStyle merticMedium,
    required TextStyle metricSmall,
  }) = _AppText;
  factory AppText.generateFrom({
    required String primaryFont,
    required String secondaryFont,
    double sizeMultiplier = 1,
    required ColorScheme colors,
  }) {
    return AppText(
      primaryFont: primaryFont,
      secondaryFont: secondaryFont,
      displayLarge: TextStyle(
        fontSize: 57 * sizeMultiplier,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
        letterSpacing: -0.25,
        fontFamily: primaryFont,
      ),
      displayMedium: TextStyle(
        fontSize: 45.0 * sizeMultiplier,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      displaySmall: TextStyle(
        fontSize: 36.0 * sizeMultiplier,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.0 * sizeMultiplier,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.0 * sizeMultiplier,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.0 * sizeMultiplier,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      titleLarge: TextStyle(
        fontSize: 22.0 * sizeMultiplier,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      titleMedium: TextStyle(
        fontSize: 16.0 * sizeMultiplier,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      titleSmall: TextStyle(
        fontSize: 14.0 * sizeMultiplier,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0 * sizeMultiplier,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0 * sizeMultiplier,
        fontWeight: FontWeight.w400,
        color: colors.onSurfaceVariant,
        fontFamily: primaryFont,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0 * sizeMultiplier,
        fontWeight: FontWeight.w400,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      labelLarge: TextStyle(
        fontSize: 14.0 * sizeMultiplier,
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      labelMedium: TextStyle(
        fontSize: 12.0 * sizeMultiplier,
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      labelSmall: TextStyle(
        fontSize: 10.0 * sizeMultiplier,
        fontWeight: FontWeight.w500,
        color: colors.onSurface,
        fontFamily: primaryFont,
      ),
      metricLarge: TextStyle(
        fontSize: 14.0 * sizeMultiplier,
        fontWeight: FontWeight.w500,
        color: colors.onSurfaceVariant,
        fontFamily: secondaryFont,
      ),
      merticMedium: TextStyle(
        fontSize: 12.0 * sizeMultiplier,
        fontWeight: FontWeight.w500,
        color: colors.onSurfaceVariant,
        fontFamily: secondaryFont,
      ),
      metricSmall: TextStyle(
        fontSize: 10.0 * sizeMultiplier,
        fontWeight: FontWeight.w500,
        color: colors.onSurfaceVariant,
        fontFamily: secondaryFont,
      ),
    );
  }
  TextTheme get textTheme {
    return TextTheme(
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}

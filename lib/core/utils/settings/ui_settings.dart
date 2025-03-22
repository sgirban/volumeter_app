import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'ui_settings.freezed.dart';

@freezed
abstract class UiSettings with _$UiSettings {
  const factory UiSettings({
    @HiveField(0) required String currentTheme,
    @HiveField(1) required String primaryFont,
    @HiveField(2) required String secondary,
    @HiveField(3) required bool distractionFreeMode,
    @HiveField(4) required bool enableThemeSwitchButton,
    @HiveField(5) required bool enableLanguageSwitchButton,
    @HiveField(6) required String paneMode,
    @HiveField(7) required String locale,
  }) = _UiSettings;
  factory UiSettings.defaults() {
    return const UiSettings(
      currentTheme: 'atom_light',
      primaryFont: 'Inter',
      secondary: 'Roboto_Mono',
      distractionFreeMode: false,
      enableLanguageSwitchButton: false,
      enableThemeSwitchButton: true,
      paneMode: 'auto',
      locale: 'en',
    );
  }
}

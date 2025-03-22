import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/utils/settings/ui_settings.dart';
import 'package:volumeter/services/hive_service.dart';

final uiSettingsProvider =
    StateNotifierProvider<UiSettingsNotifier, UiSettings>((ref) {
      return UiSettingsNotifier();
    });

class UiSettingsNotifier extends StateNotifier<UiSettings> {
  UiSettingsNotifier() : super(UiSettings.defaults()) {
    _loadInitialSettings();
  }
  Future<void> _loadInitialSettings() async {
    final settings = await HiveService().load<UiSettings>('user_settings');
    if (settings != null) {
      state = settings;
    }
  }

  Future<void> updateSettings(UiSettings settings) async {
    state = settings;
    await HiveService().save<UiSettings>(key: 'user_settings', value: settings);
  }

  Future<void> updateCurrentTheme(String theme) async {
    state = state.copyWith(currentTheme: theme);
    await HiveService().save<UiSettings>(key: 'user_settings', value: state);
  }

  Future<void> updateCurrentLocale(String locale) async {
    state = state.copyWith(locale: locale);
    await HiveService().save<UiSettings>(key: 'user_settings', value: state);
  }

  Future<void> resetToDefaults() async {
    state = UiSettings.defaults();
    await HiveService().delete<UiSettings>('user_settings');
  }
}

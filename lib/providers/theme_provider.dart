import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/theme/volumeter_theme.dart';
import 'package:volumeter/providers/ui_settings_provider.dart';

final themeProvider = Provider<VolumeterTheme>((ref) {
  final uiSettings = ref.watch(uiSettingsProvider);
  return VolumeterTheme.fromSettings(uiSettings);
});

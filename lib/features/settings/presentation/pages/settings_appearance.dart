import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/theme/app_colors.dart';
import 'package:volumeter/features/settings/domain/models/settings_item_multiradio.dart';
import 'package:volumeter/features/settings/presentation/widgets/combo_settings_item.dart';
import 'package:volumeter/features/settings/presentation/widgets/font_card_combo.dart';
import 'package:volumeter/features/settings/presentation/widgets/layout_preview_widget.dart';
import 'package:volumeter/features/settings/presentation/widgets/multi_radio_setting_item.dart';
import 'package:volumeter/features/settings/presentation/widgets/settings_group.dart';
import 'package:volumeter/features/settings/presentation/widgets/toggle_settings_item.dart';
import 'package:volumeter/features/settings/presentation/widgets/window_theme_previewer.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/providers/ui_settings_provider.dart';

class SettingsAppearance extends ConsumerStatefulWidget {
  const SettingsAppearance({super.key, this.scrollToSection});

  /// Uses fragment from `router` in order to ensure the requested group is visible
  ///
  /// By default the value is `null`. In this case the page is loaded at the top.
  final String? scrollToSection;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SettingsAppearanceState();
}

class _SettingsAppearanceState extends ConsumerState<SettingsAppearance> {
  final _sectionKeys = <String, GlobalKey>{
    'theme': GlobalKey(),
    'font': GlobalKey(),
    'layout': GlobalKey(),
    'language': GlobalKey(),
  };
  @override
  void didChangeDependencies() {
    _scrollToSection();
    super.didChangeDependencies();
  }

  void _scrollToSection() {
    if (widget.scrollToSection == null) return;
    final key = _sectionKeys[widget.scrollToSection];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 300),
        alignment: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;
    final text = ref.watch(themeProvider.select((s) => s.text));
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    final uiSettings = ref.watch(uiSettingsProvider);
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              localizations.appearance,
              style: text.headlineLarge.copyWith(color: colors.primary),
            ),
          ),
        ),
        const SizedBox(height: 64),
        // Theme customization
        //
        //
        SettingsGroup(
          key: _sectionKeys['theme'],
          title: localizations.themeCustomization,
          children: [
            MultiRadioSettingItem(
              rounded: false,
              title: localizations.themeSelection,
              items: [
                SettingsItemMultiradio<String>(
                  title: 'Atom Light',
                  value: 'atom_light',
                  child: WindowThemePreviewer(
                    colorScheme: AppColors.atomLight(),
                  ),
                ),
                SettingsItemMultiradio<String>(
                  title: 'Atom Dark',
                  value: 'atom_dark',
                  child: WindowThemePreviewer(
                    colorScheme: AppColors.atomDark(),
                  ),
                ),
                SettingsItemMultiradio<String>(
                  title: 'Midnight',
                  value: 'midnight',
                  child: WindowThemePreviewer(
                    colorScheme: AppColors.midnight(),
                  ),
                ),
              ],
              selectedValue: uiSettings.currentTheme,
              onChanged: (theme) {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateSettings(uiSettings.copyWith(currentTheme: theme));
              },
            ),
          ],
        ),
        const SizedBox(height: 32.0),

        /// Typography
        ///
        SettingsGroup(
          key: _sectionKeys['font'],
          title: localizations.typographyAndReadability,
          children: [
            FontCardCombo(
              selectedFont: uiSettings.primaryFont,
              onChanged: (font) {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateSettings(uiSettings.copyWith(primaryFont: font));
              },
            ),
            ToggleSettingsItem(
              title: localizations.distractionFreeMode,
              description: localizations.distractionFreeModeDesc,
              value: uiSettings.distractionFreeMode,
              onToggle: (value) {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateSettings(
                      uiSettings.copyWith(distractionFreeMode: value),
                    );
              },
            ),
          ],
        ),
        const SizedBox(height: 32.0),
        SettingsGroup(
          key: _sectionKeys['layout'],
          title: localizations.layout,
          children: [
            MultiRadioSettingItem(
              title: 'NavBarr',
              items: [
                const SettingsItemMultiradio<String>(
                  title: 'Auto',
                  value: 'auto',
                  child: LayoutPreviewWidget(),
                ),
                const SettingsItemMultiradio<String>(
                  title: 'Compact',
                  value: 'compact',
                  child: LayoutPreviewWidget(
                    mode: fluent.PaneDisplayMode.compact,
                  ),
                ),
                const SettingsItemMultiradio<String>(
                  title: 'Top',
                  value: 'top',
                  child: LayoutPreviewWidget(mode: fluent.PaneDisplayMode.top),
                ),
              ],
              selectedValue: uiSettings.paneMode,
              onChanged: (value) {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateSettings(uiSettings.copyWith(paneMode: value));
              },
            ),
            ToggleSettingsItem(
              enabled: isDesktopWeb,
              title: localizations.layoutEnableTheme,
              info: localizations.layoutEnableThemeInfo,
              value: uiSettings.enableThemeSwitchButton,
              onToggle: (value) {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateSettings(
                      uiSettings.copyWith(enableThemeSwitchButton: value),
                    );
              },
            ),
            ToggleSettingsItem(
              enabled: isDesktopWeb,
              title: localizations.layoutEnableLang,
              info: localizations.layoutEnableLangInfo,
              value: uiSettings.enableLanguageSwitchButton,
              onToggle: (value) {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateSettings(
                      uiSettings.copyWith(enableLanguageSwitchButton: value),
                    );
              },
            ),
          ],
        ),

        /// Language & Region
        const SizedBox(height: 32),
        SettingsGroup(
          key: _sectionKeys['language'],
          title: localizations.languageAndRegion,
          children: [
            ComboSettingsItem(
              title: localizations.languageInterface,
              description: localizations.languageInterfaceDesc,
              items: ['English', 'Română'],
              selectedValue: uiSettings.locale == 'ro' ? 'Română' : 'English',
              onChanged: (value) {
                if (value == 'English') {
                  ref
                      .read(uiSettingsProvider.notifier)
                      .updateSettings(uiSettings.copyWith(locale: 'en'));
                } else {
                  ref
                      .read(uiSettingsProvider.notifier)
                      .updateSettings(uiSettings.copyWith(locale: 'ro'));
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

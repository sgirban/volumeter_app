import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/settings/domain/models/settings_category.dart';
import 'package:volumeter/features/settings/presentation/widgets/settings_category_card.dart';
import 'package:volumeter/providers/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.localizations;
    final textTheme = ref.watch(themeProvider.select((s) => s.text));
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          centerTitle: true,
          title: Center(
            child: Text(
              locale.settings,
              style: textTheme.headlineMedium.copyWith(color: colors.primary),
            ),
          ),
          backgroundColor: colors.surface,
        ),
        const SliverPadding(
          padding: EdgeInsets.all(24.0),
          sliver: _SettingsGrid(),
        ),
      ],
    );
  }
}

class _SettingsGrid extends StatelessWidget {
  const _SettingsGrid();
  List<SettingsCategory> _buildCategories(BuildContext context) {
    final locale = context.localizations;
    return <SettingsCategory>[
      SettingsCategory(
        id: 'appearance',
        title: locale.appearance,
        subtitle: locale.appearanceDesc,
        icon: Icons.palette_outlined,
      ),
      SettingsCategory(
        id: 'server',
        title: locale.server,
        subtitle: locale.serverDesc,
        icon: Icons.dns_rounded,
      ),
      SettingsCategory(
        id: 'models',
        title: locale.models,
        subtitle: locale.modelsDesc,
        icon: fluent.FluentIcons.network_device_scanning,
      ),
      SettingsCategory(
        id: 'data',
        title: locale.data,
        subtitle: locale.dataDesc,
        icon: fluent.FluentIcons.data_flow,
      ),
      SettingsCategory(
        id: 'advanced',
        title: locale.advanced,
        subtitle: locale.advancedDesc,
        icon: fluent.FluentIcons.power_shell,
      ),
      SettingsCategory(
        id: 'about',
        title: locale.about,
        subtitle: locale.aboutDesc,
        icon: Icons.info_outline_rounded,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final settingsCategories = _buildCategories(context);
    return SliverGrid(
      gridDelegate:
          context.mobileLayout
              ? const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3,
              )
              : const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.7,
              ),
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            SettingsCategoryCard(category: settingsCategories[index]),
        childCount: settingsCategories.length,
      ),
    );
  }
}

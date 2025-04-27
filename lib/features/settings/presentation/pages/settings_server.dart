import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/constants/network_constants.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/settings/presentation/widgets/connection_setting_item.dart';
import 'package:volumeter/features/settings/presentation/widgets/network_info_setting_item.dart';
import 'package:volumeter/features/settings/presentation/widgets/ping_setting_item.dart';
import 'package:volumeter/features/settings/presentation/widgets/settings_group.dart';
import 'package:volumeter/features/settings/presentation/widgets/settings_text_input_item.dart';
import 'package:volumeter/providers/theme_provider.dart';

class SettingsServer extends ConsumerStatefulWidget {
  const SettingsServer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsServerState();
}

class _SettingsServerState extends ConsumerState<SettingsServer> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations;
    final text = ref.watch(themeProvider.select((s) => s.text));
    final colors = ref.watch(themeProvider.select((s) => s.colors));
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              localizations.serverDesc,
              style: text.headlineLarge.copyWith(color: colors.primary),
            ),
          ),
        ),
        const SizedBox(height: 64),

        /// Self network
        SettingsGroup(
          title: localizations.selfNetwork,
          description: localizations.selfNetworkDesc,
          children: const [ConnectionSettingItem(), NetworkInfoSettingItem()],
        ),
        const SizedBox(height: 32),
        SettingsGroup(
          title: localizations.server,
          children: [
            const PingSettingItem(),
            SettingsTextInputItem(
              title: 'IP',
              onSubmitted: (value) {},
              width: 150,
              initialValue: kServerIP,
              textAlignment: TextAlign.center,
            ),
            SettingsTextInputItem(
              title: 'Port',
              onSubmitted: (value) {},
              width: 150,
              initialValue: kServerPort.toString(),
              textAlignment: TextAlign.center,
              format: RegExp(
                r'^([0-9]{1,4}|[1-5][0-9]{4}|6[0-4][0-9]{3}|65[0-4][0-9]{2}|655[0-2][0-9]|6553[0-5])$',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

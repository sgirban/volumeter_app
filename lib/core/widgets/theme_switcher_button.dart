import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart' as cupertino show CupertinoIcons;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/providers/ui_settings_provider.dart';

final FlyoutController _butonMenuConroller = FlyoutController();

class ThemeSwitcherButton extends ConsumerWidget {
  const ThemeSwitcherButton({super.key});

  void _showContextMenu(WidgetRef ref) {
    _butonMenuConroller.showFlyout(
      autoModeConfiguration: FlyoutAutoConfiguration(
        preferredMode: FlyoutPlacementMode.bottomCenter,
      ),
      barrierDismissible: true,
      dismissWithEsc: true,
      dismissOnPointerMoveAway: false,
      builder: (context) {
        return MenuFlyout(
          items: [
            MenuFlyoutItem(
              text: const Text('Atom Light'),
              onPressed: () {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateCurrentTheme('atom_light');
              },
            ),
            MenuFlyoutItem(
              text: const Text('Atom Dark'),
              onPressed: () {
                ref
                    .read(uiSettingsProvider.notifier)
                    .updateCurrentTheme('atom_dark');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBright =
        ref.watch(themeProvider.select((s) => s.colors.brightness)) ==
        Brightness.light;
    if (isBright) {
      return FlyoutTarget(
        controller: _butonMenuConroller,
        child: IconButton(
          icon: const Icon(FluentIcons.brightness, size: 20),
          onPressed: () => _showContextMenu(ref),
        ),
      );
    }
    return FlyoutTarget(
      controller: _butonMenuConroller,
      child: IconButton(
        icon: const Icon(cupertino.CupertinoIcons.moon, size: 20),
        onPressed: () => _showContextMenu(ref),
      ),
    );
  }
}

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/providers/ui_settings_provider.dart';

final FlyoutController _butonMenuConroller = FlyoutController();

class LanguageSwitcherButton extends ConsumerWidget {
  const LanguageSwitcherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlyoutTarget(
      controller: _butonMenuConroller,
      child: IconButton(
        icon: const Icon(FluentIcons.locale_language, size: 20),
        onPressed: () {
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
                    leading: const Image(
                      fit: BoxFit.contain,
                      height: 20,
                      image: AssetImage('assets/icons/flags/enflag.png'),
                    ),
                    text: const Text('English'),
                    onPressed: () {
                      ref
                          .read(uiSettingsProvider.notifier)
                          .updateCurrentLocale('en');
                    },
                  ),
                  MenuFlyoutItem(
                    leading: const Image(
                      fit: BoxFit.contain,
                      height: 20,
                      image: AssetImage('assets/icons/flags/roflag.png'),
                    ),
                    text: const Text('Română'),
                    onPressed: () {
                      ref
                          .read(uiSettingsProvider.notifier)
                          .updateCurrentLocale('ro');
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

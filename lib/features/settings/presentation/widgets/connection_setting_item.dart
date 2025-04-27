import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent show FluentIcons;
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/utils/open_settings.dart';
import 'package:volumeter/providers/theme_provider.dart';

class ConnectionSettingItem extends ConsumerStatefulWidget {
  const ConnectionSettingItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConnectionSettingItemState();
}

class _ConnectionSettingItemState extends ConsumerState<ConnectionSettingItem> {
  ConnectivityResult result = ConnectivityResult.none;
  late final StreamSubscription<List<ConnectivityResult>> subscription;

  /// Builds the UI for the connection setting item.
  ///
  /// This widget is responsible for rendering the UI elements
  /// associated with a connection setting, which may include
  /// various controls and display components based on the
  /// current state and configuration.

  @override
  Widget build(BuildContext context) {
    final primaryColor = ref.watch(
      themeProvider.select((s) => s.colors.primary),
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const SizedBox(width: 16),
          if (result == ConnectivityResult.wifi)
            Icon(Icons.wifi, size: 30, color: primaryColor),

          if (result == ConnectivityResult.mobile)
            Icon(
              CupertinoIcons.arrow_up_arrow_down,
              size: 30,
              color: primaryColor,
            ),
          if (result == ConnectivityResult.none)
            const Icon(Icons.wifi_off_rounded, size: 30),
          if (result == ConnectivityResult.ethernet)
            Icon(fluent.FluentIcons.my_network, size: 30, color: primaryColor),
          const SizedBox(width: 16),
          if (result == ConnectivityResult.wifi)
            Text('Wi-Fi', style: Theme.of(context).textTheme.titleMedium),
          if (result == ConnectivityResult.mobile)
            Text(
              context.localizations.mobileData,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          if (result == ConnectivityResult.none)
            Text(
              context.localizations.noConnection,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          if (result == ConnectivityResult.ethernet)
            Text('Ethernet', style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          IconButton(
            onPressed: () async {
              await openAppSettings();
            },
            icon: const Icon(CupertinoIcons.right_chevron),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((
      connectivityResult,
    ) {
      setState(() {
        result = connectivityResult.lastOrNull ?? ConnectivityResult.none;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';

Future<void> openAppSettings() async {
  if (defaultTargetPlatform == TargetPlatform.windows) {
    Process.run('cmd', ['/c', 'start ms-settings:network-status']);
  }

  if (defaultTargetPlatform == TargetPlatform.macOS) {
    Process.run('open', [
      'x-apple.systempreferences:com.apple.preference.network',
    ]);
  }

  if (defaultTargetPlatform == TargetPlatform.linux) {
    Process.run('nm-connection-editor', []);
  }
}

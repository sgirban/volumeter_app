import 'package:flutter/foundation.dart%20';

bool get isDesktop {
  if (kIsWeb) {
    return false;
  }
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

bool get isDesktopWeb {
  if (kIsWeb) {
    return true;
  }
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

bool get isIOS {
  return defaultTargetPlatform == TargetPlatform.iOS;
}

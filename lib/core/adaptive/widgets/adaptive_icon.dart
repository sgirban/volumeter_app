import 'package:flutter/foundation.dart%20';
import 'package:flutter/material.dart';
import 'package:volumeter/core/adaptive/platform/platform_detector.dart';

class AdaptiveIcon extends StatelessWidget {
  const AdaptiveIcon({
    super.key,
    required this.desktop,
    required this.android,
    this.web,
    this.ios,
  });
  final IconData desktop;
  final IconData? web;
  final IconData android;
  final IconData? ios;

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Icon(desktop);
    }
    if (kIsWeb) {
      if (web != null) {
        return Icon(web);
      }
      return Icon(desktop);
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      if (ios != null) {
        return Icon(ios);
      }
      return Icon(android);
    }
    return Icon(android);
  }
}

import 'package:flutter/gestures.dart';
import 'package:fluent_ui/fluent_ui.dart';

class DesktopDragBehaviour extends FluentScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

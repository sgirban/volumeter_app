import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({super.key, required this.child});
  final Widget child;

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _shakeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _shakeAnimation = Tween<double>(
      begin: 0.0,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        final offsetX =
            math.sin(_controller.value * math.pi * 4) * _shakeAnimation.value;
        return Transform.translate(
          offset: Offset(offsetX, 0),
          child: widget.child,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/settings/presentation/widgets/ripple_painter.dart';
import 'package:volumeter/features/settings/presentation/widgets/shake_widget.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/services/ping_service.dart';

enum _PingStatus { idle, waiting, success, failure }

class PingSettingItem extends ConsumerStatefulWidget {
  const PingSettingItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PingSettingItemState();
}

class _PingSettingItemState extends ConsumerState<PingSettingItem>
    with TickerProviderStateMixin {
  _PingStatus _status = _PingStatus.idle;

  late final AnimationController _rippleController;
  late final Animation<double> _rippleAnimation;

  late final AnimationController _feedbackController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _rippleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rippleController, curve: Curves.easeOut),
    );

    _feedbackController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _feedbackController, curve: Curves.elasticOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _feedbackController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _rippleController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  void _onPing() async {
    if (_status == _PingStatus.waiting) return;
    setState(() {
      _status = _PingStatus.waiting;
    });
    _rippleController.repeat();
    pingServer()
        .then((isSuccess) {
          _onPingResult(isSuccess);
        })
        .catchError((error) {
          _onPingResult(false);
        });
  }

  void _onPingResult(bool isSuccess) {
    _rippleController.stop();
    setState(() {
      isSuccess ? _status = _PingStatus.success : _status = _PingStatus.failure;
    });
    _feedbackController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ref.watch(themeProvider.select((s) => s.text));
    Color baseColor;
    if (_status == _PingStatus.idle) {
      baseColor = Colors.grey;
    } else if (_status == _PingStatus.waiting) {
      baseColor = Colors.blue;
    } else if (_status == _PingStatus.success) {
      baseColor = Colors.green;
    } else {
      baseColor = Colors.red;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localizations.pingTheServer,
                  style: textTheme.titleMedium,
                ),
              ),
              const Spacer(),

              AbsorbPointer(
                child: FilledButton(
                  onPressed: _onPing,
                  style: FilledButton.styleFrom(
                    backgroundColor: baseColor,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                  child: Text(
                    context.localizations.serverPingStatus(
                      _getTextStatus(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: _onPing,
          child: SizedBox(
            width: 200,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_status == _PingStatus.waiting)
                  AnimatedBuilder(
                    animation: _rippleAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _rippleAnimation.value,
                        child: CustomPaint(
                          painter: RipplePainter(
                            animationValue: _rippleAnimation.value,
                            color: baseColor,
                          ),
                          child: Container(),
                        ),
                      );
                    },
                  ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: _buildCentralIcon(baseColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(context.localizations.tapTheCircleToPing),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCentralIcon(Color baseColor) {
    if (_status == _PingStatus.idle || _status == _PingStatus.waiting) {
      return const Icon(
        Icons.radio_button_unchecked,
        color: Colors.blue,
        size: 60,
        key: ValueKey('idleIcon'),
      );
    } else if (_status == _PingStatus.success) {
      return ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: const Icon(
            Icons.check,
            color: Colors.green,
            size: 60,
            key: ValueKey('successIcon'),
          ),
        ),
      );
    } else if (_status == _PingStatus.failure) {
      return const ShakeWidget(
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: 60,
          key: ValueKey('failureIcon'),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  String _getTextStatus(BuildContext context) {
    switch (_status) {
      case _PingStatus.idle:
        return context.localizations.localeName == 'ro' ? 'Inactiv' : 'Idle';
      case _PingStatus.waiting:
        return context.localizations.localeName == 'ro'
            ? 'În așteptare'
            : 'Waiting';
      case _PingStatus.success:
        return context.localizations.localeName == 'ro'
            ? 'Conectat'
            : 'Connected';
      case _PingStatus.failure:
        return context.localizations.localeName == 'ro' ? 'Eșuat' : 'Failed';
    }
  }
}

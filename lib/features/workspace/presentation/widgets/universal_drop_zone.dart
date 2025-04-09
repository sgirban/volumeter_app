import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class UniversalDropZone extends ConsumerStatefulWidget {
  const UniversalDropZone({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UniversalDropZoneState();
}

class _UniversalDropZoneState extends ConsumerState<UniversalDropZone> {
  bool _isDragOver = false;
  Widget _preview = const SizedBox();
  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: [],
      onDropOver: _onDropOver,
      onPerformDrop: _onPedformDrop,
      onDropLeave: _onDropLeave,
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: _isDragOver ? 1 : 0,
                duration: 200.ms,
                child: _preview,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropOperation _onDropOver(DropOverEvent event) {
    setState(() {
      _isDragOver = true;
      _preview = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.black.withValues(alpha: 0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ListView(
                  shrinkWrap: true,
                  children: event.session.items
                      .map<Widget>((e) => _DropItemInfo(dropItem: e))
                      .toList(growable: false),
                ),
              ),
            ),
          ),
        ),
      );
    });
    return DropOperation.copy;
  }

  Future<void> _onPedformDrop(PerformDropEvent event) async {
    final item = event.session.items.first;
    final readerv = item.dataReader!;
    if (readerv.canProvide(Formats.png)) {
      readerv.getFile(Formats.png, (value) {});
    }
  }

  void _onDropLeave(DropEvent event) {
    setState(() {
      _isDragOver = false;
    });
  }
}

class _DropItemInfo extends StatelessWidget {
  const _DropItemInfo({required this.dropItem});
  final DropItem dropItem;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

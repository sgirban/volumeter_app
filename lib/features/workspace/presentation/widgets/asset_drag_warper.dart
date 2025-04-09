import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';
import 'package:volumeter/providers/assets_provider.dart';

class AssetDragWarper extends ConsumerStatefulWidget {
  const AssetDragWarper({super.key, required this.asset, required this.child});

  final ImageAsset asset;
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AssetDragWarperState();
}

class _AssetDragWarperState extends ConsumerState<AssetDragWarper> {
  bool _dragging = false;

  @override
  /// Build a [Container] widget that wraps the given [child] widget into a
  /// draggable widget using [Draggable] widget.
  ///
  /// The data of the drag is the [asset] object.
  Widget build(BuildContext context) {
    return DragItemWidget(
      allowedOperations: () => [DropOperation.copy, DropOperation.link],
      canAddItemToExistingSession: false,
      dragItemProvider: dragItemProvider,
      child: DraggableWidget(
        child: AnimatedOpacity(
          opacity: _dragging ? 0.7 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }

  Future<DragItem?> dragItemProvider(DragItemRequest request) async {
    void updateDraggingState() {
      setState(() {
        _dragging = request.session.dragging.value;
        if (_dragging && mounted) {
          ref.read(assetsClipboardProvider.notifier).state = widget.asset;
        }
      });
    }

    request.session.dragging.addListener(updateDraggingState);
    updateDraggingState();

    return DragItem();
  }
}

import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/core/utils/project/assets_utils.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';
import 'package:volumeter/providers/assets_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

class AssetsPaitDrop extends ConsumerStatefulWidget {
  const AssetsPaitDrop({
    super.key,
    this.isListView = false,
    required this.asset,
    required this.child,
  });
  final bool isListView;
  final ImageAsset asset;
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssetsPaitDropState();
}

class _AssetsPaitDropState extends ConsumerState<AssetsPaitDrop> {
  bool _isDragOver = false;

  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: [],
      onDropOver: _onDropOver,
      onPerformDrop: _onPedformDrop,
      onDropLeave: _onDropLeave,
      onDropEnter: _onDropEneter,
      child: _isDragOver ? placeholder() : widget.child,
    );
  }

  FutureOr<DropOperation> _onDropOver(DropOverEvent event) {
    if (event.session.allowedOperations.contains(DropOperation.copy)) {
      return DropOperation.copy;
    } else {
      return DropOperation.none;
    }
  }

  Future<void> _onPedformDrop(PerformDropEvent event) async {
    final depthPair = ref.read(assetsClipboardProvider);
    if (depthPair != null) {
      if (depthPair.id == widget.asset.id ||
          depthPair.pairedAssetId != null ||
          widget.asset.pairedAssetId != null) {
        ref.read(assetsClipboardProvider.notifier).state = null;
        return;
      }

      await linkDepthImage(
        widget.asset,
        depthPair,
        ref.read(workspaceProvider).project,
      );
      ref
          .read(assetsProvider.notifier)
          .loadAllAssets(ref.read(workspaceProvider).project);
    }
  }

  void _onDropLeave(DropEvent event) {
    setState(() {
      _isDragOver = false;
    });
  }

  void _onDropEneter(DropEvent event) {
    setState(() {
      _isDragOver = true;
    });
  }

  Widget placeholder() {
    return AspectRatio(
      aspectRatio: widget.isListView ? 5 : 1,
      child: DottedBorder(
        strokeWidth: 2,
        dashPattern: [3, 4],
        radius: const Radius.circular(12.0),
        borderType: BorderType.RRect,
        color: ref.watch(themeProvider.select((s) => s.colors.primary)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.link,
                size: widget.isListView ? 30 : 50,
                color: ref.read(themeProvider.select((s) => s.colors.primary)),
              ),
              if (!widget.isListView) const SizedBox(height: 8.0),
              if (!widget.isListView)
                Text(
                  context.localizations.addDepthImage,
                  style: ref
                      .read(themeProvider.select((s) => s.text.bodyMedium))
                      .copyWith(
                        color: ref.read(
                          themeProvider.select((s) => s.colors.primary),
                        ),
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

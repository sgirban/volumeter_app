import 'dart:io' show File;
import 'dart:typed_data' show Uint8List;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:shimmer/shimmer.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';
import 'package:volumeter/features/workspace/presentation/widgets/assets_pait_drop.dart';
import 'package:volumeter/providers/projects_provider.dart';
import 'package:volumeter/providers/theme_provider.dart';
import 'package:volumeter/providers/workspace_provider.dart';

class AssetThumbnail extends ConsumerWidget {
  const AssetThumbnail({
    super.key,
    required this.asset,
    this.isListView = false,
  });

  /// isListView is used to determine if the thumbnail is displayed in a list view or a grid view
  ///
  /// If it is diplayed in a list view, then the sized are smaller and the image is centered
  final bool isListView;
  final ImageAsset asset;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropable = asset.pairedAssetId == null;
    return GestureDetector(
      onTap: () {
        ref.read(workspaceProvider.notifier).selectAsset(asset.id);
      },
      child:
          dropable
              ? AssetsPaitDrop(
                isListView: isListView,
                asset: asset,
                child:
                    isListView
                        ? _buildListTile(context, ref)
                        : _buildGridTile(context, ref),
              )
              : isListView
              ? _buildListTile(context, ref)
              : _buildGridTile(context, ref),
    );
  }

  Widget _buildListTile(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      workspaceProvider.select((s) => s.selectedAsset.firstOrNull == asset.id),
    );
    return ColorFiltered(
      colorFilter:
          isSelected
              ? ColorFilter.mode(
                ref.watch(
                  themeProvider.select((s) => s.colors.primary.withAlpha(70)),
                ),
                BlendMode.srcATop,
              )
              : const ColorFilter.mode(
                Colors.transparent,
                BlendMode.saturation,
              ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: ref.watch(themeProvider.select((s) => s.colors.cardColor)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(CupertinoIcons.photo),
              const SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  asset.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridTile(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      workspaceProvider.select((s) => s.selectedAsset.firstOrNull == asset.id),
    );
    return ColorFiltered(
      colorFilter:
          isSelected
              ? ColorFilter.mode(
                ref.watch(
                  themeProvider.select((s) => s.colors.primary.withAlpha(70)),
                ),
                BlendMode.srcATop,
              )
              : const ColorFilter.mode(
                Colors.transparent,
                BlendMode.saturation,
              ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: ref.watch(themeProvider.select((s) => s.colors.cardColor)),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Center(child: _buildThumbnailImage(context, ref)),
                ),
                const SizedBox(height: 4.0),
                Text(asset.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4.0),
              ],
            ),
            Positioned(
              top: 4,
              left: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  color:
                      !asset.isPaired
                          ? ref.watch(
                            themeProvider.select((s) => s.colors.primary),
                          )
                          : Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  asset.isPaired ? 'RGB-Depth' : 'RGB',
                  style: const TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _getThumbnail(String path) async {
    final thumbnail = File(path);
    if (await thumbnail.exists()) {
      final imageBytes = await thumbnail.readAsBytes();
      final image = img.decodeImage(imageBytes);
      if (image == null) {
        throw Exception('Failed to decode image');
      }
      final thumbnailImage = img.copyResize(image, height: 256);
      return img.encodePng(thumbnailImage);
    } else {
      throw Exception('Thumbnail not found');
    }
  }

  Widget _buildThumbnailImage(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: _getThumbnail(
        ref.watch(
          projectProvider.select(
            (s) =>
                s.where((e) => e.id == asset.id).firstOrNull?.path ??
                asset.path,
          ),
        ),
      ),
      builder: (context, snapshot) {
        final isBright = ref.watch(
          themeProvider.select((s) => s.colors.brightness == Brightness.light),
        );
        if (snapshot.connectionState == ConnectionState.waiting) {
          return isBright
              ? Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade300,
                child: Container(color: Colors.grey.shade600),
              )
              : Shimmer.fromColors(
                baseColor: Colors.grey.shade800,
                highlightColor: Colors.grey.shade700,
                child: Container(color: Colors.grey.shade800),
              );
        } else if (snapshot.hasError) {
          return const Icon(CupertinoIcons.exclamationmark_triangle);
        } else if (snapshot.hasData) {
          return Image.memory(snapshot.data!);
        } else {
          return const Icon(CupertinoIcons.photo);
        }
      },
    );
  }
}

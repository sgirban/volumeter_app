import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volumeter/core/adaptive/widgets/adaptive_dialog.dart';
import 'package:volumeter/core/extensions/context_extension.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';
import 'package:volumeter/features/workspace/presentation/widgets/asset_drag_warper.dart';
import 'package:volumeter/features/workspace/presentation/widgets/asset_thumbnail.dart';
import 'package:volumeter/features/workspace/presentation/widgets/file_import_zone.dart';
import 'package:volumeter/providers/assets_provider.dart';

class AssetPannel extends ConsumerWidget {
  const AssetPannel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ImageAsset> assets = ref.watch(assetsProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 300) {
          return Column(
            children: [
              _buildHeader(context),
              Expanded(child: _buildGrid(assets)),
            ],
          );
        } else {
          return Column(
            children: [
              _buildHeader(context),
              Expanded(child: _buildList(assets)),
            ],
          );
        }
      },
    );
  }

  /// A small header widget that contains an import button.
  ///
  /// It is used at the top of the AssetPannel to provide a way to import
  /// assets into the workspace.
  ///
  /// The header is a horizontal row with a spacer at the start and an
  /// [IconButton] at the end. The [IconButton] is used to trigger the
  /// import action when pressed.
  ///
  /// The header is also decorated with a bottom border to separate it
  /// from the rest of the panel.
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade800)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () => _onImportPressed(context),
            icon: const Icon(CupertinoIcons.arrow_up_doc),
          ),
        ],
      ),
    );
  }

  /// A GridView of [AssetThumbnail]s, for displaying a 2D array of assets
  /// on a wide screen.
  ///
  /// The [GridView] is configured to display a maximum of 250 pixels
  /// per child, with a cross axis spacing of 8.0 and a main axis spacing
  /// of 8.0. The child aspect ratio is set to 1.3.
  ///
  /// [AssetThumbnail]s are generated for each asset in the provided
  /// [List].
  Widget _buildGrid(List<ImageAsset> assets) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1,
      ),
      itemCount: assets.length,
      itemBuilder:
          (context, index) => AssetDragWarper(
            asset: assets[index],
            child: AssetThumbnail(asset: assets[index]),
          ),
    );
  }

  Widget _buildList(List<ImageAsset> assets) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return AssetDragWarper(
          asset: assets[index],
          child: AssetThumbnail(asset: assets[index], isListView: true),
        );
      },
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemCount: assets.length,
    );
  }

  /// Shows a dialog with a [FileImportZone] content when the import button
  /// is pressed. The dialog is an [AdaptiveDialog] with a title that is
  /// set to the localized string for "Import" and no actions.
  void _onImportPressed(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AdaptiveDialog(
            title: Text(context.localizations.import),
            content: const FileImportZone(),
            actions: [],
          ),
    );
  }
}

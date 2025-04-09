import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_asset.freezed.dart';
part 'image_asset.g.dart';

@JsonEnum()
enum AssetType { rgb, depth }

@freezed
/// A class that represents an image asset
///
/// It contains the path to the image, the id of the image and the type of the image
sealed class ImageAsset with _$ImageAsset {
  const factory ImageAsset({
    required String id,
    required String name,
    required String path,
    required AssetType type,
    @Default(false) bool isSelected,

    /// This is the id of the asset that is paired with this asset
    ///
    /// Usualy the depth asset is paired with the rgb asset
    String? pairedAssetId,
    @Default(false) bool isPaired,
  }) = _ImageAsset;
  factory ImageAsset.fromJson(Map<String, dynamic> json) =>
      _$ImageAssetFromJson(json);

  /// This method is used to create a new instance of the ImageAsset class from a json string
}

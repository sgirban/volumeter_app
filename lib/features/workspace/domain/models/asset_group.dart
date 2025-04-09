import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';
part 'asset_group.freezed.dart';

@freezed
abstract class AssetGroup with _$AssetGroup {
  const factory AssetGroup({required ImageAsset rgb, ImageAsset? depth}) =
      _AssetGroup;
}

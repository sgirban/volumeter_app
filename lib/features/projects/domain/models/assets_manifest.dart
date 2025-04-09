import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:volumeter/features/workspace/domain/models/image_asset.dart';

part 'assets_manifest.g.dart';

@JsonSerializable(explicitToJson: true)
class AssetsManifest {
  final List<ImageAsset> assets;
  final List<ImageAsset> depths;
  factory AssetsManifest.fromJson(Map<String, dynamic> json) =>
      _$AssetsManifestFromJson(json);

  AssetsManifest({this.assets = const [], this.depths = const []});
  Map<String, dynamic> toJson() => _$AssetsManifestToJson(this);
}

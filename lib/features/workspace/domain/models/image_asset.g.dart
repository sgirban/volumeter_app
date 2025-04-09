// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageAsset _$ImageAssetFromJson(Map<String, dynamic> json) => _ImageAsset(
  id: json['id'] as String,
  name: json['name'] as String,
  path: json['path'] as String,
  type: $enumDecode(_$AssetTypeEnumMap, json['type']),
  isSelected: json['isSelected'] as bool? ?? false,
  pairedAssetId: json['pairedAssetId'] as String?,
  isPaired: json['isPaired'] as bool? ?? false,
);

Map<String, dynamic> _$ImageAssetToJson(_ImageAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'type': _$AssetTypeEnumMap[instance.type]!,
      'isSelected': instance.isSelected,
      'pairedAssetId': instance.pairedAssetId,
      'isPaired': instance.isPaired,
    };

const _$AssetTypeEnumMap = {AssetType.rgb: 'rgb', AssetType.depth: 'depth'};

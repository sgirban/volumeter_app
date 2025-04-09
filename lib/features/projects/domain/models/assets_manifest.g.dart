// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetsManifest _$AssetsManifestFromJson(Map<String, dynamic> json) =>
    AssetsManifest(
      assets:
          (json['assets'] as List<dynamic>?)
              ?.map((e) => ImageAsset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      depths:
          (json['depths'] as List<dynamic>?)
              ?.map((e) => ImageAsset.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AssetsManifestToJson(AssetsManifest instance) =>
    <String, dynamic>{
      'assets': instance.assets.map((e) => e.toJson()).toList(),
      'depths': instance.depths.map((e) => e.toJson()).toList(),
    };

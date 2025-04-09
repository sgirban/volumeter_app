// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageAsset {

 String get id; String get name; String get path; AssetType get type; bool get isSelected;/// This is the id of the asset that is paired with this asset
///
/// Usualy the depth asset is paired with the rgb asset
 String? get pairedAssetId; bool get isPaired;
/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<ImageAsset> get copyWith => _$ImageAssetCopyWithImpl<ImageAsset>(this as ImageAsset, _$identity);

  /// Serializes this ImageAsset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.type, type) || other.type == type)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.pairedAssetId, pairedAssetId) || other.pairedAssetId == pairedAssetId)&&(identical(other.isPaired, isPaired) || other.isPaired == isPaired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,path,type,isSelected,pairedAssetId,isPaired);

@override
String toString() {
  return 'ImageAsset(id: $id, name: $name, path: $path, type: $type, isSelected: $isSelected, pairedAssetId: $pairedAssetId, isPaired: $isPaired)';
}


}

/// @nodoc
abstract mixin class $ImageAssetCopyWith<$Res>  {
  factory $ImageAssetCopyWith(ImageAsset value, $Res Function(ImageAsset) _then) = _$ImageAssetCopyWithImpl;
@useResult
$Res call({
 String id, String name, String path, AssetType type, bool isSelected, String? pairedAssetId, bool isPaired
});




}
/// @nodoc
class _$ImageAssetCopyWithImpl<$Res>
    implements $ImageAssetCopyWith<$Res> {
  _$ImageAssetCopyWithImpl(this._self, this._then);

  final ImageAsset _self;
  final $Res Function(ImageAsset) _then;

/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? path = null,Object? type = null,Object? isSelected = null,Object? pairedAssetId = freezed,Object? isPaired = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssetType,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,pairedAssetId: freezed == pairedAssetId ? _self.pairedAssetId : pairedAssetId // ignore: cast_nullable_to_non_nullable
as String?,isPaired: null == isPaired ? _self.isPaired : isPaired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ImageAsset implements ImageAsset {
  const _ImageAsset({required this.id, required this.name, required this.path, required this.type, this.isSelected = false, this.pairedAssetId, this.isPaired = false});
  factory _ImageAsset.fromJson(Map<String, dynamic> json) => _$ImageAssetFromJson(json);

@override final  String id;
@override final  String name;
@override final  String path;
@override final  AssetType type;
@override@JsonKey() final  bool isSelected;
/// This is the id of the asset that is paired with this asset
///
/// Usualy the depth asset is paired with the rgb asset
@override final  String? pairedAssetId;
@override@JsonKey() final  bool isPaired;

/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageAssetCopyWith<_ImageAsset> get copyWith => __$ImageAssetCopyWithImpl<_ImageAsset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageAssetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageAsset&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.type, type) || other.type == type)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.pairedAssetId, pairedAssetId) || other.pairedAssetId == pairedAssetId)&&(identical(other.isPaired, isPaired) || other.isPaired == isPaired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,path,type,isSelected,pairedAssetId,isPaired);

@override
String toString() {
  return 'ImageAsset(id: $id, name: $name, path: $path, type: $type, isSelected: $isSelected, pairedAssetId: $pairedAssetId, isPaired: $isPaired)';
}


}

/// @nodoc
abstract mixin class _$ImageAssetCopyWith<$Res> implements $ImageAssetCopyWith<$Res> {
  factory _$ImageAssetCopyWith(_ImageAsset value, $Res Function(_ImageAsset) _then) = __$ImageAssetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String path, AssetType type, bool isSelected, String? pairedAssetId, bool isPaired
});




}
/// @nodoc
class __$ImageAssetCopyWithImpl<$Res>
    implements _$ImageAssetCopyWith<$Res> {
  __$ImageAssetCopyWithImpl(this._self, this._then);

  final _ImageAsset _self;
  final $Res Function(_ImageAsset) _then;

/// Create a copy of ImageAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? path = null,Object? type = null,Object? isSelected = null,Object? pairedAssetId = freezed,Object? isPaired = null,}) {
  return _then(_ImageAsset(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AssetType,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,pairedAssetId: freezed == pairedAssetId ? _self.pairedAssetId : pairedAssetId // ignore: cast_nullable_to_non_nullable
as String?,isPaired: null == isPaired ? _self.isPaired : isPaired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

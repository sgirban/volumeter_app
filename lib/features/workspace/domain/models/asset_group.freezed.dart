// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AssetGroup {

 ImageAsset get rgb; ImageAsset? get depth;
/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetGroupCopyWith<AssetGroup> get copyWith => _$AssetGroupCopyWithImpl<AssetGroup>(this as AssetGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetGroup&&(identical(other.rgb, rgb) || other.rgb == rgb)&&(identical(other.depth, depth) || other.depth == depth));
}


@override
int get hashCode => Object.hash(runtimeType,rgb,depth);

@override
String toString() {
  return 'AssetGroup(rgb: $rgb, depth: $depth)';
}


}

/// @nodoc
abstract mixin class $AssetGroupCopyWith<$Res>  {
  factory $AssetGroupCopyWith(AssetGroup value, $Res Function(AssetGroup) _then) = _$AssetGroupCopyWithImpl;
@useResult
$Res call({
 ImageAsset rgb, ImageAsset? depth
});


$ImageAssetCopyWith<$Res> get rgb;$ImageAssetCopyWith<$Res>? get depth;

}
/// @nodoc
class _$AssetGroupCopyWithImpl<$Res>
    implements $AssetGroupCopyWith<$Res> {
  _$AssetGroupCopyWithImpl(this._self, this._then);

  final AssetGroup _self;
  final $Res Function(AssetGroup) _then;

/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rgb = null,Object? depth = freezed,}) {
  return _then(_self.copyWith(
rgb: null == rgb ? _self.rgb : rgb // ignore: cast_nullable_to_non_nullable
as ImageAsset,depth: freezed == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as ImageAsset?,
  ));
}
/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<$Res> get rgb {
  
  return $ImageAssetCopyWith<$Res>(_self.rgb, (value) {
    return _then(_self.copyWith(rgb: value));
  });
}/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<$Res>? get depth {
    if (_self.depth == null) {
    return null;
  }

  return $ImageAssetCopyWith<$Res>(_self.depth!, (value) {
    return _then(_self.copyWith(depth: value));
  });
}
}


/// @nodoc


class _AssetGroup implements AssetGroup {
  const _AssetGroup({required this.rgb, this.depth});
  

@override final  ImageAsset rgb;
@override final  ImageAsset? depth;

/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetGroupCopyWith<_AssetGroup> get copyWith => __$AssetGroupCopyWithImpl<_AssetGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetGroup&&(identical(other.rgb, rgb) || other.rgb == rgb)&&(identical(other.depth, depth) || other.depth == depth));
}


@override
int get hashCode => Object.hash(runtimeType,rgb,depth);

@override
String toString() {
  return 'AssetGroup(rgb: $rgb, depth: $depth)';
}


}

/// @nodoc
abstract mixin class _$AssetGroupCopyWith<$Res> implements $AssetGroupCopyWith<$Res> {
  factory _$AssetGroupCopyWith(_AssetGroup value, $Res Function(_AssetGroup) _then) = __$AssetGroupCopyWithImpl;
@override @useResult
$Res call({
 ImageAsset rgb, ImageAsset? depth
});


@override $ImageAssetCopyWith<$Res> get rgb;@override $ImageAssetCopyWith<$Res>? get depth;

}
/// @nodoc
class __$AssetGroupCopyWithImpl<$Res>
    implements _$AssetGroupCopyWith<$Res> {
  __$AssetGroupCopyWithImpl(this._self, this._then);

  final _AssetGroup _self;
  final $Res Function(_AssetGroup) _then;

/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rgb = null,Object? depth = freezed,}) {
  return _then(_AssetGroup(
rgb: null == rgb ? _self.rgb : rgb // ignore: cast_nullable_to_non_nullable
as ImageAsset,depth: freezed == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as ImageAsset?,
  ));
}

/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<$Res> get rgb {
  
  return $ImageAssetCopyWith<$Res>(_self.rgb, (value) {
    return _then(_self.copyWith(rgb: value));
  });
}/// Create a copy of AssetGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageAssetCopyWith<$Res>? get depth {
    if (_self.depth == null) {
    return null;
  }

  return $ImageAssetCopyWith<$Res>(_self.depth!, (value) {
    return _then(_self.copyWith(depth: value));
  });
}
}

// dart format on

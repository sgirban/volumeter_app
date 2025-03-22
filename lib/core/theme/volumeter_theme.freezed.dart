// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volumeter_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VolumeterTheme {

 AppColors get colors; AppText get text;
/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeterThemeCopyWith<VolumeterTheme> get copyWith => _$VolumeterThemeCopyWithImpl<VolumeterTheme>(this as VolumeterTheme, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeterTheme&&(identical(other.colors, colors) || other.colors == colors)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,colors,text);

@override
String toString() {
  return 'VolumeterTheme(colors: $colors, text: $text)';
}


}

/// @nodoc
abstract mixin class $VolumeterThemeCopyWith<$Res>  {
  factory $VolumeterThemeCopyWith(VolumeterTheme value, $Res Function(VolumeterTheme) _then) = _$VolumeterThemeCopyWithImpl;
@useResult
$Res call({
 AppColors colors, AppText text
});


$AppColorsCopyWith<$Res> get colors;$AppTextCopyWith<$Res> get text;

}
/// @nodoc
class _$VolumeterThemeCopyWithImpl<$Res>
    implements $VolumeterThemeCopyWith<$Res> {
  _$VolumeterThemeCopyWithImpl(this._self, this._then);

  final VolumeterTheme _self;
  final $Res Function(VolumeterTheme) _then;

/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? colors = null,Object? text = null,}) {
  return _then(_self.copyWith(
colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as AppColors,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as AppText,
  ));
}
/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorsCopyWith<$Res> get colors {
  
  return $AppColorsCopyWith<$Res>(_self.colors, (value) {
    return _then(_self.copyWith(colors: value));
  });
}/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppTextCopyWith<$Res> get text {
  
  return $AppTextCopyWith<$Res>(_self.text, (value) {
    return _then(_self.copyWith(text: value));
  });
}
}


/// @nodoc


class _VolumeterTheme extends VolumeterTheme {
  const _VolumeterTheme({required this.colors, required this.text}): super._();
  

@override final  AppColors colors;
@override final  AppText text;

/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeterThemeCopyWith<_VolumeterTheme> get copyWith => __$VolumeterThemeCopyWithImpl<_VolumeterTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeterTheme&&(identical(other.colors, colors) || other.colors == colors)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,colors,text);

@override
String toString() {
  return 'VolumeterTheme(colors: $colors, text: $text)';
}


}

/// @nodoc
abstract mixin class _$VolumeterThemeCopyWith<$Res> implements $VolumeterThemeCopyWith<$Res> {
  factory _$VolumeterThemeCopyWith(_VolumeterTheme value, $Res Function(_VolumeterTheme) _then) = __$VolumeterThemeCopyWithImpl;
@override @useResult
$Res call({
 AppColors colors, AppText text
});


@override $AppColorsCopyWith<$Res> get colors;@override $AppTextCopyWith<$Res> get text;

}
/// @nodoc
class __$VolumeterThemeCopyWithImpl<$Res>
    implements _$VolumeterThemeCopyWith<$Res> {
  __$VolumeterThemeCopyWithImpl(this._self, this._then);

  final _VolumeterTheme _self;
  final $Res Function(_VolumeterTheme) _then;

/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? colors = null,Object? text = null,}) {
  return _then(_VolumeterTheme(
colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as AppColors,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as AppText,
  ));
}

/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppColorsCopyWith<$Res> get colors {
  
  return $AppColorsCopyWith<$Res>(_self.colors, (value) {
    return _then(_self.copyWith(colors: value));
  });
}/// Create a copy of VolumeterTheme
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppTextCopyWith<$Res> get text {
  
  return $AppTextCopyWith<$Res>(_self.text, (value) {
    return _then(_self.copyWith(text: value));
  });
}
}

// dart format on

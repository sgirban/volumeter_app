// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UiSettings {

@HiveField(0) String get currentTheme;@HiveField(1) String get primaryFont;@HiveField(2) String get secondary;@HiveField(3) bool get distractionFreeMode;@HiveField(4) bool get enableThemeSwitchButton;@HiveField(5) bool get enableLanguageSwitchButton;@HiveField(6) String get paneMode;@HiveField(7) String get locale;
/// Create a copy of UiSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UiSettingsCopyWith<UiSettings> get copyWith => _$UiSettingsCopyWithImpl<UiSettings>(this as UiSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UiSettings&&(identical(other.currentTheme, currentTheme) || other.currentTheme == currentTheme)&&(identical(other.primaryFont, primaryFont) || other.primaryFont == primaryFont)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.distractionFreeMode, distractionFreeMode) || other.distractionFreeMode == distractionFreeMode)&&(identical(other.enableThemeSwitchButton, enableThemeSwitchButton) || other.enableThemeSwitchButton == enableThemeSwitchButton)&&(identical(other.enableLanguageSwitchButton, enableLanguageSwitchButton) || other.enableLanguageSwitchButton == enableLanguageSwitchButton)&&(identical(other.paneMode, paneMode) || other.paneMode == paneMode)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,currentTheme,primaryFont,secondary,distractionFreeMode,enableThemeSwitchButton,enableLanguageSwitchButton,paneMode,locale);

@override
String toString() {
  return 'UiSettings(currentTheme: $currentTheme, primaryFont: $primaryFont, secondary: $secondary, distractionFreeMode: $distractionFreeMode, enableThemeSwitchButton: $enableThemeSwitchButton, enableLanguageSwitchButton: $enableLanguageSwitchButton, paneMode: $paneMode, locale: $locale)';
}


}

/// @nodoc
abstract mixin class $UiSettingsCopyWith<$Res>  {
  factory $UiSettingsCopyWith(UiSettings value, $Res Function(UiSettings) _then) = _$UiSettingsCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String currentTheme,@HiveField(1) String primaryFont,@HiveField(2) String secondary,@HiveField(3) bool distractionFreeMode,@HiveField(4) bool enableThemeSwitchButton,@HiveField(5) bool enableLanguageSwitchButton,@HiveField(6) String paneMode,@HiveField(7) String locale
});




}
/// @nodoc
class _$UiSettingsCopyWithImpl<$Res>
    implements $UiSettingsCopyWith<$Res> {
  _$UiSettingsCopyWithImpl(this._self, this._then);

  final UiSettings _self;
  final $Res Function(UiSettings) _then;

/// Create a copy of UiSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTheme = null,Object? primaryFont = null,Object? secondary = null,Object? distractionFreeMode = null,Object? enableThemeSwitchButton = null,Object? enableLanguageSwitchButton = null,Object? paneMode = null,Object? locale = null,}) {
  return _then(_self.copyWith(
currentTheme: null == currentTheme ? _self.currentTheme : currentTheme // ignore: cast_nullable_to_non_nullable
as String,primaryFont: null == primaryFont ? _self.primaryFont : primaryFont // ignore: cast_nullable_to_non_nullable
as String,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as String,distractionFreeMode: null == distractionFreeMode ? _self.distractionFreeMode : distractionFreeMode // ignore: cast_nullable_to_non_nullable
as bool,enableThemeSwitchButton: null == enableThemeSwitchButton ? _self.enableThemeSwitchButton : enableThemeSwitchButton // ignore: cast_nullable_to_non_nullable
as bool,enableLanguageSwitchButton: null == enableLanguageSwitchButton ? _self.enableLanguageSwitchButton : enableLanguageSwitchButton // ignore: cast_nullable_to_non_nullable
as bool,paneMode: null == paneMode ? _self.paneMode : paneMode // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _UiSettings implements UiSettings {
  const _UiSettings({@HiveField(0) required this.currentTheme, @HiveField(1) required this.primaryFont, @HiveField(2) required this.secondary, @HiveField(3) required this.distractionFreeMode, @HiveField(4) required this.enableThemeSwitchButton, @HiveField(5) required this.enableLanguageSwitchButton, @HiveField(6) required this.paneMode, @HiveField(7) required this.locale});
  

@override@HiveField(0) final  String currentTheme;
@override@HiveField(1) final  String primaryFont;
@override@HiveField(2) final  String secondary;
@override@HiveField(3) final  bool distractionFreeMode;
@override@HiveField(4) final  bool enableThemeSwitchButton;
@override@HiveField(5) final  bool enableLanguageSwitchButton;
@override@HiveField(6) final  String paneMode;
@override@HiveField(7) final  String locale;

/// Create a copy of UiSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UiSettingsCopyWith<_UiSettings> get copyWith => __$UiSettingsCopyWithImpl<_UiSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UiSettings&&(identical(other.currentTheme, currentTheme) || other.currentTheme == currentTheme)&&(identical(other.primaryFont, primaryFont) || other.primaryFont == primaryFont)&&(identical(other.secondary, secondary) || other.secondary == secondary)&&(identical(other.distractionFreeMode, distractionFreeMode) || other.distractionFreeMode == distractionFreeMode)&&(identical(other.enableThemeSwitchButton, enableThemeSwitchButton) || other.enableThemeSwitchButton == enableThemeSwitchButton)&&(identical(other.enableLanguageSwitchButton, enableLanguageSwitchButton) || other.enableLanguageSwitchButton == enableLanguageSwitchButton)&&(identical(other.paneMode, paneMode) || other.paneMode == paneMode)&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,currentTheme,primaryFont,secondary,distractionFreeMode,enableThemeSwitchButton,enableLanguageSwitchButton,paneMode,locale);

@override
String toString() {
  return 'UiSettings(currentTheme: $currentTheme, primaryFont: $primaryFont, secondary: $secondary, distractionFreeMode: $distractionFreeMode, enableThemeSwitchButton: $enableThemeSwitchButton, enableLanguageSwitchButton: $enableLanguageSwitchButton, paneMode: $paneMode, locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$UiSettingsCopyWith<$Res> implements $UiSettingsCopyWith<$Res> {
  factory _$UiSettingsCopyWith(_UiSettings value, $Res Function(_UiSettings) _then) = __$UiSettingsCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String currentTheme,@HiveField(1) String primaryFont,@HiveField(2) String secondary,@HiveField(3) bool distractionFreeMode,@HiveField(4) bool enableThemeSwitchButton,@HiveField(5) bool enableLanguageSwitchButton,@HiveField(6) String paneMode,@HiveField(7) String locale
});




}
/// @nodoc
class __$UiSettingsCopyWithImpl<$Res>
    implements _$UiSettingsCopyWith<$Res> {
  __$UiSettingsCopyWithImpl(this._self, this._then);

  final _UiSettings _self;
  final $Res Function(_UiSettings) _then;

/// Create a copy of UiSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTheme = null,Object? primaryFont = null,Object? secondary = null,Object? distractionFreeMode = null,Object? enableThemeSwitchButton = null,Object? enableLanguageSwitchButton = null,Object? paneMode = null,Object? locale = null,}) {
  return _then(_UiSettings(
currentTheme: null == currentTheme ? _self.currentTheme : currentTheme // ignore: cast_nullable_to_non_nullable
as String,primaryFont: null == primaryFont ? _self.primaryFont : primaryFont // ignore: cast_nullable_to_non_nullable
as String,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as String,distractionFreeMode: null == distractionFreeMode ? _self.distractionFreeMode : distractionFreeMode // ignore: cast_nullable_to_non_nullable
as bool,enableThemeSwitchButton: null == enableThemeSwitchButton ? _self.enableThemeSwitchButton : enableThemeSwitchButton // ignore: cast_nullable_to_non_nullable
as bool,enableLanguageSwitchButton: null == enableLanguageSwitchButton ? _self.enableLanguageSwitchButton : enableLanguageSwitchButton // ignore: cast_nullable_to_non_nullable
as bool,paneMode: null == paneMode ? _self.paneMode : paneMode // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

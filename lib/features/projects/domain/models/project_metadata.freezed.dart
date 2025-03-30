// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectMetadata {

@HiveField(0) String get id;@HiveField(1) String get path;@HiveField(2) String get name;@HiveField(3) String get description;@HiveField(4) int get color;@HiveField(5) DateTime get createdAt;@HiveField(6) DateTime get updatedAt;@HiveField(7) ProjectStatus get status;@HiveField(8) ProjectMode get mode;
/// Create a copy of ProjectMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectMetadataCopyWith<ProjectMetadata> get copyWith => _$ProjectMetadataCopyWithImpl<ProjectMetadata>(this as ProjectMetadata, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectMetadata&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,id,path,name,description,color,createdAt,updatedAt,status,mode);

@override
String toString() {
  return 'ProjectMetadata(id: $id, path: $path, name: $name, description: $description, color: $color, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, mode: $mode)';
}


}

/// @nodoc
abstract mixin class $ProjectMetadataCopyWith<$Res>  {
  factory $ProjectMetadataCopyWith(ProjectMetadata value, $Res Function(ProjectMetadata) _then) = _$ProjectMetadataCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String path,@HiveField(2) String name,@HiveField(3) String description,@HiveField(4) int color,@HiveField(5) DateTime createdAt,@HiveField(6) DateTime updatedAt,@HiveField(7) ProjectStatus status,@HiveField(8) ProjectMode mode
});




}
/// @nodoc
class _$ProjectMetadataCopyWithImpl<$Res>
    implements $ProjectMetadataCopyWith<$Res> {
  _$ProjectMetadataCopyWithImpl(this._self, this._then);

  final ProjectMetadata _self;
  final $Res Function(ProjectMetadata) _then;

/// Create a copy of ProjectMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? path = null,Object? name = null,Object? description = null,Object? color = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? mode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ProjectMode,
  ));
}

}


/// @nodoc


class _ProjectMetadata implements ProjectMetadata {
  const _ProjectMetadata({@HiveField(0) required this.id, @HiveField(1) required this.path, @HiveField(2) required this.name, @HiveField(3) required this.description, @HiveField(4) required this.color, @HiveField(5) required this.createdAt, @HiveField(6) required this.updatedAt, @HiveField(7) required this.status, @HiveField(8) required this.mode});
  

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String path;
@override@HiveField(2) final  String name;
@override@HiveField(3) final  String description;
@override@HiveField(4) final  int color;
@override@HiveField(5) final  DateTime createdAt;
@override@HiveField(6) final  DateTime updatedAt;
@override@HiveField(7) final  ProjectStatus status;
@override@HiveField(8) final  ProjectMode mode;

/// Create a copy of ProjectMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectMetadataCopyWith<_ProjectMetadata> get copyWith => __$ProjectMetadataCopyWithImpl<_ProjectMetadata>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectMetadata&&(identical(other.id, id) || other.id == id)&&(identical(other.path, path) || other.path == path)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.mode, mode) || other.mode == mode));
}


@override
int get hashCode => Object.hash(runtimeType,id,path,name,description,color,createdAt,updatedAt,status,mode);

@override
String toString() {
  return 'ProjectMetadata(id: $id, path: $path, name: $name, description: $description, color: $color, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, mode: $mode)';
}


}

/// @nodoc
abstract mixin class _$ProjectMetadataCopyWith<$Res> implements $ProjectMetadataCopyWith<$Res> {
  factory _$ProjectMetadataCopyWith(_ProjectMetadata value, $Res Function(_ProjectMetadata) _then) = __$ProjectMetadataCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String path,@HiveField(2) String name,@HiveField(3) String description,@HiveField(4) int color,@HiveField(5) DateTime createdAt,@HiveField(6) DateTime updatedAt,@HiveField(7) ProjectStatus status,@HiveField(8) ProjectMode mode
});




}
/// @nodoc
class __$ProjectMetadataCopyWithImpl<$Res>
    implements _$ProjectMetadataCopyWith<$Res> {
  __$ProjectMetadataCopyWithImpl(this._self, this._then);

  final _ProjectMetadata _self;
  final $Res Function(_ProjectMetadata) _then;

/// Create a copy of ProjectMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? path = null,Object? name = null,Object? description = null,Object? color = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? mode = null,}) {
  return _then(_ProjectMetadata(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ProjectMode,
  ));
}


}

// dart format on

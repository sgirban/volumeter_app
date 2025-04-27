// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkspaceState {

 String get workspacePath; ProjectMetadata get project; WorkspaceViewType get viewType; Set<String> get selectedAsset;
/// Create a copy of WorkspaceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceStateCopyWith<WorkspaceState> get copyWith => _$WorkspaceStateCopyWithImpl<WorkspaceState>(this as WorkspaceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceState&&(identical(other.workspacePath, workspacePath) || other.workspacePath == workspacePath)&&(identical(other.project, project) || other.project == project)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&const DeepCollectionEquality().equals(other.selectedAsset, selectedAsset));
}


@override
int get hashCode => Object.hash(runtimeType,workspacePath,project,viewType,const DeepCollectionEquality().hash(selectedAsset));

@override
String toString() {
  return 'WorkspaceState(workspacePath: $workspacePath, project: $project, viewType: $viewType, selectedAsset: $selectedAsset)';
}


}

/// @nodoc
abstract mixin class $WorkspaceStateCopyWith<$Res>  {
  factory $WorkspaceStateCopyWith(WorkspaceState value, $Res Function(WorkspaceState) _then) = _$WorkspaceStateCopyWithImpl;
@useResult
$Res call({
 String workspacePath, ProjectMetadata project, WorkspaceViewType viewType, Set<String> selectedAsset
});


$ProjectMetadataCopyWith<$Res> get project;

}
/// @nodoc
class _$WorkspaceStateCopyWithImpl<$Res>
    implements $WorkspaceStateCopyWith<$Res> {
  _$WorkspaceStateCopyWithImpl(this._self, this._then);

  final WorkspaceState _self;
  final $Res Function(WorkspaceState) _then;

/// Create a copy of WorkspaceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workspacePath = null,Object? project = null,Object? viewType = null,Object? selectedAsset = null,}) {
  return _then(_self.copyWith(
workspacePath: null == workspacePath ? _self.workspacePath : workspacePath // ignore: cast_nullable_to_non_nullable
as String,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectMetadata,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as WorkspaceViewType,selectedAsset: null == selectedAsset ? _self.selectedAsset : selectedAsset // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}
/// Create a copy of WorkspaceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectMetadataCopyWith<$Res> get project {
  
  return $ProjectMetadataCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// @nodoc


class _WorkspaceState implements WorkspaceState {
  const _WorkspaceState({required this.workspacePath, required this.project, this.viewType = WorkspaceViewType.view2D, final  Set<String> selectedAsset = const <String>{}}): _selectedAsset = selectedAsset;
  

@override final  String workspacePath;
@override final  ProjectMetadata project;
@override@JsonKey() final  WorkspaceViewType viewType;
 final  Set<String> _selectedAsset;
@override@JsonKey() Set<String> get selectedAsset {
  if (_selectedAsset is EqualUnmodifiableSetView) return _selectedAsset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedAsset);
}


/// Create a copy of WorkspaceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceStateCopyWith<_WorkspaceState> get copyWith => __$WorkspaceStateCopyWithImpl<_WorkspaceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceState&&(identical(other.workspacePath, workspacePath) || other.workspacePath == workspacePath)&&(identical(other.project, project) || other.project == project)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&const DeepCollectionEquality().equals(other._selectedAsset, _selectedAsset));
}


@override
int get hashCode => Object.hash(runtimeType,workspacePath,project,viewType,const DeepCollectionEquality().hash(_selectedAsset));

@override
String toString() {
  return 'WorkspaceState(workspacePath: $workspacePath, project: $project, viewType: $viewType, selectedAsset: $selectedAsset)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceStateCopyWith<$Res> implements $WorkspaceStateCopyWith<$Res> {
  factory _$WorkspaceStateCopyWith(_WorkspaceState value, $Res Function(_WorkspaceState) _then) = __$WorkspaceStateCopyWithImpl;
@override @useResult
$Res call({
 String workspacePath, ProjectMetadata project, WorkspaceViewType viewType, Set<String> selectedAsset
});


@override $ProjectMetadataCopyWith<$Res> get project;

}
/// @nodoc
class __$WorkspaceStateCopyWithImpl<$Res>
    implements _$WorkspaceStateCopyWith<$Res> {
  __$WorkspaceStateCopyWithImpl(this._self, this._then);

  final _WorkspaceState _self;
  final $Res Function(_WorkspaceState) _then;

/// Create a copy of WorkspaceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workspacePath = null,Object? project = null,Object? viewType = null,Object? selectedAsset = null,}) {
  return _then(_WorkspaceState(
workspacePath: null == workspacePath ? _self.workspacePath : workspacePath // ignore: cast_nullable_to_non_nullable
as String,project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectMetadata,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as WorkspaceViewType,selectedAsset: null == selectedAsset ? _self._selectedAsset : selectedAsset // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of WorkspaceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectMetadataCopyWith<$Res> get project {
  
  return $ProjectMetadataCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on

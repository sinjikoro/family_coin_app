// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDetail {

 String get description;@DifficultyJsonConverter() Difficulty get difficulty;
/// Create a copy of TaskDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailCopyWith<TaskDetail> get copyWith => _$TaskDetailCopyWithImpl<TaskDetail>(this as TaskDetail, _$identity);

  /// Serializes this TaskDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,difficulty);

@override
String toString() {
  return 'TaskDetail(description: $description, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class $TaskDetailCopyWith<$Res>  {
  factory $TaskDetailCopyWith(TaskDetail value, $Res Function(TaskDetail) _then) = _$TaskDetailCopyWithImpl;
@useResult
$Res call({
 String description,@DifficultyJsonConverter() Difficulty difficulty
});




}
/// @nodoc
class _$TaskDetailCopyWithImpl<$Res>
    implements $TaskDetailCopyWith<$Res> {
  _$TaskDetailCopyWithImpl(this._self, this._then);

  final TaskDetail _self;
  final $Res Function(TaskDetail) _then;

/// Create a copy of TaskDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? difficulty = null,}) {
  return _then(_self.copyWith(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TaskDetail extends TaskDetail {
  const _TaskDetail({this.description = '', @DifficultyJsonConverter() this.difficulty = Difficulty.normal}): super._();
  factory _TaskDetail.fromJson(Map<String, dynamic> json) => _$TaskDetailFromJson(json);

@override@JsonKey() final  String description;
@override@JsonKey()@DifficultyJsonConverter() final  Difficulty difficulty;

/// Create a copy of TaskDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDetailCopyWith<_TaskDetail> get copyWith => __$TaskDetailCopyWithImpl<_TaskDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDetail&&(identical(other.description, description) || other.description == description)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,difficulty);

@override
String toString() {
  return 'TaskDetail(description: $description, difficulty: $difficulty)';
}


}

/// @nodoc
abstract mixin class _$TaskDetailCopyWith<$Res> implements $TaskDetailCopyWith<$Res> {
  factory _$TaskDetailCopyWith(_TaskDetail value, $Res Function(_TaskDetail) _then) = __$TaskDetailCopyWithImpl;
@override @useResult
$Res call({
 String description,@DifficultyJsonConverter() Difficulty difficulty
});




}
/// @nodoc
class __$TaskDetailCopyWithImpl<$Res>
    implements _$TaskDetailCopyWith<$Res> {
  __$TaskDetailCopyWithImpl(this._self, this._then);

  final _TaskDetail _self;
  final $Res Function(_TaskDetail) _then;

/// Create a copy of TaskDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? description = null,Object? difficulty = null,}) {
  return _then(_TaskDetail(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,
  ));
}


}

// dart format on

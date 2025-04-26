// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskLog {

@IdJsonConverter() Id get id;@IdJsonConverter() Id get taskId;@IdJsonConverter() Id get userId;@ApprovalStatusJsonConverter() ApprovalStatus get approvalStatus;@FamilyCoinJsonConverter() FamilyCoin get earnedCoins; DateTime get earnedAt; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TaskLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskLogCopyWith<TaskLog> get copyWith => _$TaskLogCopyWithImpl<TaskLog>(this as TaskLog, _$identity);

  /// Serializes this TaskLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskLog&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.earnedCoins, earnedCoins) || other.earnedCoins == earnedCoins)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,approvalStatus,earnedCoins,earnedAt,createdAt,updatedAt);

@override
String toString() {
  return 'TaskLog(id: $id, taskId: $taskId, userId: $userId, approvalStatus: $approvalStatus, earnedCoins: $earnedCoins, earnedAt: $earnedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskLogCopyWith<$Res>  {
  factory $TaskLogCopyWith(TaskLog value, $Res Function(TaskLog) _then) = _$TaskLogCopyWithImpl;
@useResult
$Res call({
@IdJsonConverter() Id id,@IdJsonConverter() Id taskId,@IdJsonConverter() Id userId,@ApprovalStatusJsonConverter() ApprovalStatus approvalStatus,@FamilyCoinJsonConverter() FamilyCoin earnedCoins, DateTime earnedAt, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TaskLogCopyWithImpl<$Res>
    implements $TaskLogCopyWith<$Res> {
  _$TaskLogCopyWithImpl(this._self, this._then);

  final TaskLog _self;
  final $Res Function(TaskLog) _then;

/// Create a copy of TaskLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? userId = null,Object? approvalStatus = null,Object? earnedCoins = null,Object? earnedAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as Id,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,earnedCoins: null == earnedCoins ? _self.earnedCoins : earnedCoins // ignore: cast_nullable_to_non_nullable
as FamilyCoin,earnedAt: null == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TaskLog extends TaskLog {
  const _TaskLog({@IdJsonConverter() required this.id, @IdJsonConverter() required this.taskId, @IdJsonConverter() required this.userId, @ApprovalStatusJsonConverter() required this.approvalStatus, @FamilyCoinJsonConverter() required this.earnedCoins, required this.earnedAt, required this.createdAt, required this.updatedAt}): super._();
  factory _TaskLog.fromJson(Map<String, dynamic> json) => _$TaskLogFromJson(json);

@override@IdJsonConverter() final  Id id;
@override@IdJsonConverter() final  Id taskId;
@override@IdJsonConverter() final  Id userId;
@override@ApprovalStatusJsonConverter() final  ApprovalStatus approvalStatus;
@override@FamilyCoinJsonConverter() final  FamilyCoin earnedCoins;
@override final  DateTime earnedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TaskLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskLogCopyWith<_TaskLog> get copyWith => __$TaskLogCopyWithImpl<_TaskLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskLog&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.earnedCoins, earnedCoins) || other.earnedCoins == earnedCoins)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,approvalStatus,earnedCoins,earnedAt,createdAt,updatedAt);

@override
String toString() {
  return 'TaskLog(id: $id, taskId: $taskId, userId: $userId, approvalStatus: $approvalStatus, earnedCoins: $earnedCoins, earnedAt: $earnedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskLogCopyWith<$Res> implements $TaskLogCopyWith<$Res> {
  factory _$TaskLogCopyWith(_TaskLog value, $Res Function(_TaskLog) _then) = __$TaskLogCopyWithImpl;
@override @useResult
$Res call({
@IdJsonConverter() Id id,@IdJsonConverter() Id taskId,@IdJsonConverter() Id userId,@ApprovalStatusJsonConverter() ApprovalStatus approvalStatus,@FamilyCoinJsonConverter() FamilyCoin earnedCoins, DateTime earnedAt, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TaskLogCopyWithImpl<$Res>
    implements _$TaskLogCopyWith<$Res> {
  __$TaskLogCopyWithImpl(this._self, this._then);

  final _TaskLog _self;
  final $Res Function(_TaskLog) _then;

/// Create a copy of TaskLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? userId = null,Object? approvalStatus = null,Object? earnedCoins = null,Object? earnedAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as Id,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,earnedCoins: null == earnedCoins ? _self.earnedCoins : earnedCoins // ignore: cast_nullable_to_non_nullable
as FamilyCoin,earnedAt: null == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

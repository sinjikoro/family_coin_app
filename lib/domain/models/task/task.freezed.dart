// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {

@IdJsonConverter() Id get id; String get name;@IdJsonConverter() Id get userId;@FamilyCoinJsonConverter() FamilyCoin get earnCoins;@ApprovalStatusJsonConverter() ApprovalStatus get registrationStatus; TaskDetail get detail;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.earnCoins, earnCoins) || other.earnCoins == earnCoins)&&(identical(other.registrationStatus, registrationStatus) || other.registrationStatus == registrationStatus)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,userId,earnCoins,registrationStatus,detail);

@override
String toString() {
  return 'Task(id: $id, name: $name, userId: $userId, earnCoins: $earnCoins, registrationStatus: $registrationStatus, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
@IdJsonConverter() Id id, String name,@IdJsonConverter() Id userId,@FamilyCoinJsonConverter() FamilyCoin earnCoins,@ApprovalStatusJsonConverter() ApprovalStatus registrationStatus, TaskDetail detail
});


$TaskDetailCopyWith<$Res> get detail;

}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? userId = null,Object? earnCoins = null,Object? registrationStatus = null,Object? detail = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,earnCoins: null == earnCoins ? _self.earnCoins : earnCoins // ignore: cast_nullable_to_non_nullable
as FamilyCoin,registrationStatus: null == registrationStatus ? _self.registrationStatus : registrationStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as TaskDetail,
  ));
}
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDetailCopyWith<$Res> get detail {
  
  return $TaskDetailCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Task extends Task {
  const _Task({@IdJsonConverter() required this.id, required this.name, @IdJsonConverter() required this.userId, @FamilyCoinJsonConverter() required this.earnCoins, @ApprovalStatusJsonConverter() required this.registrationStatus, required this.detail}): super._();
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override@IdJsonConverter() final  Id id;
@override final  String name;
@override@IdJsonConverter() final  Id userId;
@override@FamilyCoinJsonConverter() final  FamilyCoin earnCoins;
@override@ApprovalStatusJsonConverter() final  ApprovalStatus registrationStatus;
@override final  TaskDetail detail;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.earnCoins, earnCoins) || other.earnCoins == earnCoins)&&(identical(other.registrationStatus, registrationStatus) || other.registrationStatus == registrationStatus)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,userId,earnCoins,registrationStatus,detail);

@override
String toString() {
  return 'Task(id: $id, name: $name, userId: $userId, earnCoins: $earnCoins, registrationStatus: $registrationStatus, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
@IdJsonConverter() Id id, String name,@IdJsonConverter() Id userId,@FamilyCoinJsonConverter() FamilyCoin earnCoins,@ApprovalStatusJsonConverter() ApprovalStatus registrationStatus, TaskDetail detail
});


@override $TaskDetailCopyWith<$Res> get detail;

}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? userId = null,Object? earnCoins = null,Object? registrationStatus = null,Object? detail = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,earnCoins: null == earnCoins ? _self.earnCoins : earnCoins // ignore: cast_nullable_to_non_nullable
as FamilyCoin,registrationStatus: null == registrationStatus ? _self.registrationStatus : registrationStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as TaskDetail,
  ));
}

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDetailCopyWith<$Res> get detail {
  
  return $TaskDetailCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

// dart format on

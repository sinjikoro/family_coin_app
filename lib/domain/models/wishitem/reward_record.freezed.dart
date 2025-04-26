// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardRecord {

@IdJsonConverter() Id get id;@IdJsonConverter() Id get wishitemId;@IdJsonConverter() Id get userId;@FamilyCoinJsonConverter() FamilyCoin get exchangedCoins;@ApprovalStatusJsonConverter() ApprovalStatus get approvalStatus; DateTime get createdAt; DateTime get updatedAt; DateTime? get exchangedAt;
/// Create a copy of RewardRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardRecordCopyWith<RewardRecord> get copyWith => _$RewardRecordCopyWithImpl<RewardRecord>(this as RewardRecord, _$identity);

  /// Serializes this RewardRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.wishitemId, wishitemId) || other.wishitemId == wishitemId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.exchangedCoins, exchangedCoins) || other.exchangedCoins == exchangedCoins)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.exchangedAt, exchangedAt) || other.exchangedAt == exchangedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,wishitemId,userId,exchangedCoins,approvalStatus,createdAt,updatedAt,exchangedAt);

@override
String toString() {
  return 'RewardRecord(id: $id, wishitemId: $wishitemId, userId: $userId, exchangedCoins: $exchangedCoins, approvalStatus: $approvalStatus, createdAt: $createdAt, updatedAt: $updatedAt, exchangedAt: $exchangedAt)';
}


}

/// @nodoc
abstract mixin class $RewardRecordCopyWith<$Res>  {
  factory $RewardRecordCopyWith(RewardRecord value, $Res Function(RewardRecord) _then) = _$RewardRecordCopyWithImpl;
@useResult
$Res call({
@IdJsonConverter() Id id,@IdJsonConverter() Id wishitemId,@IdJsonConverter() Id userId,@FamilyCoinJsonConverter() FamilyCoin exchangedCoins,@ApprovalStatusJsonConverter() ApprovalStatus approvalStatus, DateTime createdAt, DateTime updatedAt, DateTime? exchangedAt
});




}
/// @nodoc
class _$RewardRecordCopyWithImpl<$Res>
    implements $RewardRecordCopyWith<$Res> {
  _$RewardRecordCopyWithImpl(this._self, this._then);

  final RewardRecord _self;
  final $Res Function(RewardRecord) _then;

/// Create a copy of RewardRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? wishitemId = null,Object? userId = null,Object? exchangedCoins = null,Object? approvalStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? exchangedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,wishitemId: null == wishitemId ? _self.wishitemId : wishitemId // ignore: cast_nullable_to_non_nullable
as Id,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,exchangedCoins: null == exchangedCoins ? _self.exchangedCoins : exchangedCoins // ignore: cast_nullable_to_non_nullable
as FamilyCoin,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,exchangedAt: freezed == exchangedAt ? _self.exchangedAt : exchangedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RewardRecord extends RewardRecord {
  const _RewardRecord({@IdJsonConverter() required this.id, @IdJsonConverter() required this.wishitemId, @IdJsonConverter() required this.userId, @FamilyCoinJsonConverter() required this.exchangedCoins, @ApprovalStatusJsonConverter() required this.approvalStatus, required this.createdAt, required this.updatedAt, this.exchangedAt}): super._();
  factory _RewardRecord.fromJson(Map<String, dynamic> json) => _$RewardRecordFromJson(json);

@override@IdJsonConverter() final  Id id;
@override@IdJsonConverter() final  Id wishitemId;
@override@IdJsonConverter() final  Id userId;
@override@FamilyCoinJsonConverter() final  FamilyCoin exchangedCoins;
@override@ApprovalStatusJsonConverter() final  ApprovalStatus approvalStatus;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? exchangedAt;

/// Create a copy of RewardRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardRecordCopyWith<_RewardRecord> get copyWith => __$RewardRecordCopyWithImpl<_RewardRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.wishitemId, wishitemId) || other.wishitemId == wishitemId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.exchangedCoins, exchangedCoins) || other.exchangedCoins == exchangedCoins)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.exchangedAt, exchangedAt) || other.exchangedAt == exchangedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,wishitemId,userId,exchangedCoins,approvalStatus,createdAt,updatedAt,exchangedAt);

@override
String toString() {
  return 'RewardRecord(id: $id, wishitemId: $wishitemId, userId: $userId, exchangedCoins: $exchangedCoins, approvalStatus: $approvalStatus, createdAt: $createdAt, updatedAt: $updatedAt, exchangedAt: $exchangedAt)';
}


}

/// @nodoc
abstract mixin class _$RewardRecordCopyWith<$Res> implements $RewardRecordCopyWith<$Res> {
  factory _$RewardRecordCopyWith(_RewardRecord value, $Res Function(_RewardRecord) _then) = __$RewardRecordCopyWithImpl;
@override @useResult
$Res call({
@IdJsonConverter() Id id,@IdJsonConverter() Id wishitemId,@IdJsonConverter() Id userId,@FamilyCoinJsonConverter() FamilyCoin exchangedCoins,@ApprovalStatusJsonConverter() ApprovalStatus approvalStatus, DateTime createdAt, DateTime updatedAt, DateTime? exchangedAt
});




}
/// @nodoc
class __$RewardRecordCopyWithImpl<$Res>
    implements _$RewardRecordCopyWith<$Res> {
  __$RewardRecordCopyWithImpl(this._self, this._then);

  final _RewardRecord _self;
  final $Res Function(_RewardRecord) _then;

/// Create a copy of RewardRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? wishitemId = null,Object? userId = null,Object? exchangedCoins = null,Object? approvalStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? exchangedAt = freezed,}) {
  return _then(_RewardRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,wishitemId: null == wishitemId ? _self.wishitemId : wishitemId // ignore: cast_nullable_to_non_nullable
as Id,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,exchangedCoins: null == exchangedCoins ? _self.exchangedCoins : exchangedCoins // ignore: cast_nullable_to_non_nullable
as FamilyCoin,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,exchangedAt: freezed == exchangedAt ? _self.exchangedAt : exchangedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

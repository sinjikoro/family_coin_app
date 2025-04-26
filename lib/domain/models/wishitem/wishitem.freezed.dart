// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishitem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Wishitem {

@IdJsonConverter() Id get id; String get name;@IdJsonConverter() Id get userId;@ApprovalStatusJsonConverter() ApprovalStatus get approvalStatus;@FamilyCoinJsonConverter() FamilyCoin get price; WishitemDetail get detail;
/// Create a copy of Wishitem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WishitemCopyWith<Wishitem> get copyWith => _$WishitemCopyWithImpl<Wishitem>(this as Wishitem, _$identity);

  /// Serializes this Wishitem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wishitem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,userId,approvalStatus,price,detail);

@override
String toString() {
  return 'Wishitem(id: $id, name: $name, userId: $userId, approvalStatus: $approvalStatus, price: $price, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $WishitemCopyWith<$Res>  {
  factory $WishitemCopyWith(Wishitem value, $Res Function(Wishitem) _then) = _$WishitemCopyWithImpl;
@useResult
$Res call({
@IdJsonConverter() Id id, String name,@IdJsonConverter() Id userId,@ApprovalStatusJsonConverter() ApprovalStatus approvalStatus,@FamilyCoinJsonConverter() FamilyCoin price, WishitemDetail detail
});


$WishitemDetailCopyWith<$Res> get detail;

}
/// @nodoc
class _$WishitemCopyWithImpl<$Res>
    implements $WishitemCopyWith<$Res> {
  _$WishitemCopyWithImpl(this._self, this._then);

  final Wishitem _self;
  final $Res Function(Wishitem) _then;

/// Create a copy of Wishitem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? userId = null,Object? approvalStatus = null,Object? price = null,Object? detail = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as FamilyCoin,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as WishitemDetail,
  ));
}
/// Create a copy of Wishitem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WishitemDetailCopyWith<$Res> get detail {
  
  return $WishitemDetailCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Wishitem extends Wishitem {
  const _Wishitem({@IdJsonConverter() required this.id, required this.name, @IdJsonConverter() required this.userId, @ApprovalStatusJsonConverter() required this.approvalStatus, @FamilyCoinJsonConverter() required this.price, required this.detail}): super._();
  factory _Wishitem.fromJson(Map<String, dynamic> json) => _$WishitemFromJson(json);

@override@IdJsonConverter() final  Id id;
@override final  String name;
@override@IdJsonConverter() final  Id userId;
@override@ApprovalStatusJsonConverter() final  ApprovalStatus approvalStatus;
@override@FamilyCoinJsonConverter() final  FamilyCoin price;
@override final  WishitemDetail detail;

/// Create a copy of Wishitem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WishitemCopyWith<_Wishitem> get copyWith => __$WishitemCopyWithImpl<_Wishitem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WishitemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wishitem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,userId,approvalStatus,price,detail);

@override
String toString() {
  return 'Wishitem(id: $id, name: $name, userId: $userId, approvalStatus: $approvalStatus, price: $price, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$WishitemCopyWith<$Res> implements $WishitemCopyWith<$Res> {
  factory _$WishitemCopyWith(_Wishitem value, $Res Function(_Wishitem) _then) = __$WishitemCopyWithImpl;
@override @useResult
$Res call({
@IdJsonConverter() Id id, String name,@IdJsonConverter() Id userId,@ApprovalStatusJsonConverter() ApprovalStatus approvalStatus,@FamilyCoinJsonConverter() FamilyCoin price, WishitemDetail detail
});


@override $WishitemDetailCopyWith<$Res> get detail;

}
/// @nodoc
class __$WishitemCopyWithImpl<$Res>
    implements _$WishitemCopyWith<$Res> {
  __$WishitemCopyWithImpl(this._self, this._then);

  final _Wishitem _self;
  final $Res Function(_Wishitem) _then;

/// Create a copy of Wishitem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? userId = null,Object? approvalStatus = null,Object? price = null,Object? detail = null,}) {
  return _then(_Wishitem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Id,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as Id,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as FamilyCoin,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as WishitemDetail,
  ));
}

/// Create a copy of Wishitem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WishitemDetailCopyWith<$Res> get detail {
  
  return $WishitemDetailCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

// dart format on

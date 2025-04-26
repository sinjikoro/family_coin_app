// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Wishitem _$WishitemFromJson(Map<String, dynamic> json) => _Wishitem(
  id: const IdJsonConverter().fromJson((json['id'] as num).toInt()),
  name: json['name'] as String,
  userId: const IdJsonConverter().fromJson((json['userId'] as num).toInt()),
  approvalStatus: const ApprovalStatusJsonConverter().fromJson(
    json['approvalStatus'] as String,
  ),
  price: const FamilyCoinJsonConverter().fromJson(
    (json['price'] as num).toInt(),
  ),
  detail: WishitemDetail.fromJson(json['detail'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WishitemToJson(_Wishitem instance) => <String, dynamic>{
  'id': const IdJsonConverter().toJson(instance.id),
  'name': instance.name,
  'userId': const IdJsonConverter().toJson(instance.userId),
  'approvalStatus': const ApprovalStatusJsonConverter().toJson(
    instance.approvalStatus,
  ),
  'price': const FamilyCoinJsonConverter().toJson(instance.price),
  'detail': instance.detail,
};

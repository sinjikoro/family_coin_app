// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: const IdJsonConverter().fromJson((json['id'] as num).toInt()),
  name: json['name'] as String,
  userId: const IdJsonConverter().fromJson((json['userId'] as num).toInt()),
  earnCoins: const FamilyCoinJsonConverter().fromJson(
    (json['earnCoins'] as num).toInt(),
  ),
  registrationStatus: const ApprovalStatusJsonConverter().fromJson(
    json['registrationStatus'] as String,
  ),
  detail: TaskDetail.fromJson(json['detail'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': const IdJsonConverter().toJson(instance.id),
  'name': instance.name,
  'userId': const IdJsonConverter().toJson(instance.userId),
  'earnCoins': const FamilyCoinJsonConverter().toJson(instance.earnCoins),
  'registrationStatus': const ApprovalStatusJsonConverter().toJson(
    instance.registrationStatus,
  ),
  'detail': instance.detail,
};

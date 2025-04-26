// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardRecord _$RewardRecordFromJson(Map<String, dynamic> json) =>
    _RewardRecord(
      id: const IdJsonConverter().fromJson((json['id'] as num).toInt()),
      wishitemId: const IdJsonConverter().fromJson(
        (json['wishitemId'] as num).toInt(),
      ),
      userId: const IdJsonConverter().fromJson((json['userId'] as num).toInt()),
      exchangedCoins: const FamilyCoinJsonConverter().fromJson(
        (json['exchangedCoins'] as num).toInt(),
      ),
      approvalStatus: const ApprovalStatusJsonConverter().fromJson(
        json['approvalStatus'] as String,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      exchangedAt:
          json['exchangedAt'] == null
              ? null
              : DateTime.parse(json['exchangedAt'] as String),
    );

Map<String, dynamic> _$RewardRecordToJson(_RewardRecord instance) =>
    <String, dynamic>{
      'id': const IdJsonConverter().toJson(instance.id),
      'wishitemId': const IdJsonConverter().toJson(instance.wishitemId),
      'userId': const IdJsonConverter().toJson(instance.userId),
      'exchangedCoins': const FamilyCoinJsonConverter().toJson(
        instance.exchangedCoins,
      ),
      'approvalStatus': const ApprovalStatusJsonConverter().toJson(
        instance.approvalStatus,
      ),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'exchangedAt': instance.exchangedAt?.toIso8601String(),
    };

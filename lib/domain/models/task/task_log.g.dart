// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskLog _$TaskLogFromJson(Map<String, dynamic> json) => _TaskLog(
  id: const IdJsonConverter().fromJson((json['id'] as num).toInt()),
  taskId: const IdJsonConverter().fromJson((json['taskId'] as num).toInt()),
  userId: const IdJsonConverter().fromJson((json['userId'] as num).toInt()),
  approvalStatus: const ApprovalStatusJsonConverter().fromJson(
    json['approvalStatus'] as String,
  ),
  earnedCoins: const FamilyCoinJsonConverter().fromJson(
    (json['earnedCoins'] as num).toInt(),
  ),
  earnedAt: DateTime.parse(json['earnedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TaskLogToJson(_TaskLog instance) => <String, dynamic>{
  'id': const IdJsonConverter().toJson(instance.id),
  'taskId': const IdJsonConverter().toJson(instance.taskId),
  'userId': const IdJsonConverter().toJson(instance.userId),
  'approvalStatus': const ApprovalStatusJsonConverter().toJson(
    instance.approvalStatus,
  ),
  'earnedCoins': const FamilyCoinJsonConverter().toJson(instance.earnedCoins),
  'earnedAt': instance.earnedAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

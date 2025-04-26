// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDetail _$TaskDetailFromJson(Map<String, dynamic> json) => _TaskDetail(
  description: json['description'] as String? ?? '',
  difficulty:
      json['difficulty'] == null
          ? Difficulty.normal
          : const DifficultyJsonConverter().fromJson(
            json['difficulty'] as String,
          ),
);

Map<String, dynamic> _$TaskDetailToJson(_TaskDetail instance) =>
    <String, dynamic>{
      'description': instance.description,
      'difficulty': const DifficultyJsonConverter().toJson(instance.difficulty),
    };

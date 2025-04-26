// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: const IdJsonConverter().fromJson((json['id'] as num).toInt()),
  name: json['name'] as String,
  familyCoin: const FamilyCoinJsonConverter().fromJson(
    (json['familyCoin'] as num).toInt(),
  ),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': const IdJsonConverter().toJson(instance.id),
  'name': instance.name,
  'familyCoin': const FamilyCoinJsonConverter().toJson(instance.familyCoin),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishitem_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WishitemDetail _$WishitemDetailFromJson(Map<String, dynamic> json) =>
    _WishitemDetail(
      description: json['description'] as String? ?? '',
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
    );

Map<String, dynamic> _$WishitemDetailToJson(_WishitemDetail instance) =>
    <String, dynamic>{
      'description': instance.description,
      'url': instance.url?.toString(),
    };

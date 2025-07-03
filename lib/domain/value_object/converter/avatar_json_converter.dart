import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// アバターのJSONコンバーター
class AvatarJsonConverter implements JsonConverter<Avatar, String> {
  /// Constructor
  const AvatarJsonConverter();

  @override
  Avatar fromJson(String json) => Avatar.byName(json);

  @override
  String toJson(Avatar object) => object.toString();
}

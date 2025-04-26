import 'package:family_coin/domain/value_objects/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ID
class Id extends ValueObject<int> {
  /// Constructor
  const Id(this.value);

  /// 値
  @override
  final int value;
}

/// IDのJSONコンバーター
class IdJsonConverter implements JsonConverter<Id, int> {
  /// Constructor
  const IdJsonConverter();

  @override
  Id fromJson(int json) => Id(json);

  @override
  int toJson(Id object) => object.value;
}

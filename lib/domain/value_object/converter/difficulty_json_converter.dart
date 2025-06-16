import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// 難易度のJSONコンバーター
class DifficultyJsonConverter implements JsonConverter<Difficulty, String> {
  /// Constructor
  const DifficultyJsonConverter();

  @override
  Difficulty fromJson(String json) => Difficulty.byName(json);

  @override
  String toJson(Difficulty object) => object.value;
}

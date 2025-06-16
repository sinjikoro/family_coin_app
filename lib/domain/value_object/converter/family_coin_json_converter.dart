import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ファミリーコインのJSONコンバーター
class FamilyCoinJsonConverter implements JsonConverter<FamilyCoin, int> {
  /// Constructor
  const FamilyCoinJsonConverter();

  @override
  FamilyCoin fromJson(int json) => FamilyCoin(json);

  @override
  int toJson(FamilyCoin object) => object.value;
}

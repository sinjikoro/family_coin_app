import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ファミリーコイン
class FamilyCoin extends ValueObject<int> {
  /// Constructor
  const FamilyCoin(this.value);

  /// 値
  @override
  final int value;
}

/// ファミリーコインのJSONコンバーター
class FamilyCoinJsonConverter implements JsonConverter<FamilyCoin, int> {
  /// Constructor
  const FamilyCoinJsonConverter();

  @override
  FamilyCoin fromJson(int json) => FamilyCoin(json);

  @override
  int toJson(FamilyCoin object) => object.value;
}

import 'package:family_coin/domain/value_object/base/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ID
class Id extends ValueObject<int> {
  /// コンストラクタ
  factory Id(int value) {
    if (value < 0) {
      throw ArgumentError('IDは0以上である必要があります。');
    }
    return Id._(value);
  }

  /// 非採番用のコンストラクタ
  const Id.unassigned() : this._(0);

  /// プライベートコンストラクタ
  const Id._(this.value);

  /// 値
  @override
  final int value;

  /// 採番済みかどうか
  bool get isAssigned => value > 0;
}

/// IDのJSONコンバーター
class IdJsonConverter implements JsonConverter<Id, int> {
  /// コンストラクタ
  const IdJsonConverter();

  @override
  Id fromJson(int json) => Id(json);

  @override
  int toJson(Id object) => object.value;
}

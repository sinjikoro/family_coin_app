import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// ほしいものID
class WishitemId extends ValueObject<int> {
  /// constructor
  const WishitemId(this.value);

  /// 値
  @override
  final int value;
}

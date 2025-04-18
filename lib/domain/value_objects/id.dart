import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// ID
class Id extends ValueObject<int> {
  /// Constructor
  Id(this.value);

  /// 値
  @override
  final int value;
}

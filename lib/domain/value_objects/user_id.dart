import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// ファミリーコイン
class UserId extends ValueObject<int> {
  /// Constructor
  UserId({required this.value});

  /// 値
  @override
  final int value;
}

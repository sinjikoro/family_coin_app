import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// ファミリーコイン
class FamilyCoin extends ValueObject<int> {
  /// Constructor
  FamilyCoin({required this.value});

  /// 値
  @override
  final int value;
}

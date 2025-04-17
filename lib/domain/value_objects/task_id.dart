import 'package:family_coin/domain/value_objects/base/value_object.dart';

/// タスクID
class TaskId extends ValueObject<int> {
  /// constructor
  TaskId(this.value);

  /// 値
  @override
  final int value;
}

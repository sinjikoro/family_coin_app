import 'dart:math';

import 'package:family_coin/domain/value_object/base/value_object.dart';

/// エンティティの識別子を表す値オブジェクト
class Id<T> extends ValueObject<int> {
  /// constructor
  factory Id(int value) {
    if (value < 0) {
      throw ArgumentError('IDは0以上である必要があります。');
    }
    return Id._(value);
  }

  /// 非採番用のコンストラクタ
  const Id.unassigned() : this._(0);

  /// 採番用のコンストラクタ
  factory Id.generate() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(1000);
    return Id((timestamp * 1000) + random);
  }

  /// プライベートコンストラクタ
  const Id._(this.value);

  /// 値
  @override
  final int value;

  /// 採番済みかどうか
  bool get isAssigned => value > 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Id<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toString();
}

/// ユーザーIDを表す型
class UserId extends Id<UserId> {
  /// constructor
  factory UserId(int value) => UserId._(Id(value).value);

  /// constructor
  const UserId._(super.value) : super._();

  /// 非採番用のコンストラクタ
  const UserId.unassigned() : super.unassigned();

  /// 採番用のコンストラクタ
  factory UserId.generate() => UserId._(Id.generate().value);
}

/// タスクIDを表す型
class TaskId extends Id<TaskId> {
  /// constructor
  factory TaskId(int value) => TaskId._(Id(value).value);

  /// constructor
  const TaskId._(super.value) : super._();

  /// 非採番用のコンストラクタ
  const TaskId.unassigned() : super.unassigned();

  /// 採番用のコンストラクタ
  factory TaskId.generate() => TaskId._(Id.generate().value);
}

/// ほしいものIDを表す型
class WishitemId extends Id<WishitemId> {
  /// constructor
  factory WishitemId(int value) => WishitemId._(Id(value).value);

  /// constructor
  const WishitemId._(super.value) : super._();

  /// 非採番用のコンストラクタ
  const WishitemId.unassigned() : super.unassigned();

  /// 採番用のコンストラクタ
  factory WishitemId.generate() => WishitemId._(Id.generate().value);
}

/// ログIDを表す型
class LogId extends Id<LogId> {
  /// constructor
  factory LogId(int value) => LogId._(Id(value).value);

  /// constructor
  const LogId._(super.value) : super._();

  /// 採番用のコンストラクタ
  factory LogId.generate() => LogId._(Id.generate().value);

  /// 非採番用のコンストラクタ
  const LogId.unassigned() : super.unassigned();
}

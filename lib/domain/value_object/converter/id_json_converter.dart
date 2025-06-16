import 'package:family_coin/domain/value_object/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// ユーザーIDのJSONコンバーター
class UserIdJsonConverter implements JsonConverter<UserId, int> {
  /// コンストラクタ
  const UserIdJsonConverter();

  @override
  UserId fromJson(int json) => UserId(json);

  @override
  int toJson(UserId object) => object.value;
}

/// タスクIDのJSONコンバーター
class TaskIdJsonConverter implements JsonConverter<TaskId, int> {
  /// コンストラクタ
  const TaskIdJsonConverter();

  @override
  TaskId fromJson(int json) => TaskId(json);

  @override
  int toJson(TaskId object) => object.value;
}

/// ほしいものIDのJSONコンバーター
class WishitemIdJsonConverter implements JsonConverter<WishitemId, int> {
  /// コンストラクタ
  const WishitemIdJsonConverter();

  @override
  WishitemId fromJson(int json) => WishitemId(json);

  @override
  int toJson(WishitemId object) => object.value;
}

/// ログIDのJSONコンバーター
class LogIdJsonConverter implements JsonConverter<LogId, int> {
  /// コンストラクタ
  const LogIdJsonConverter();

  @override
  LogId fromJson(int json) => LogId(json);

  @override
  int toJson(LogId object) => object.value;
}

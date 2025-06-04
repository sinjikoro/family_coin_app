import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/repository/task_log_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskLogRepository extends Mock implements TaskLogRepository {
  List<TaskLog> dummyTaskLogList = [];

  @override
  Future<List<TaskLog>> getTaskLogList({required UserId userId}) async =>
      dummyTaskLogList.where((element) => element.userId == userId).toList();

  @override
  Future<void> addLog({required TaskLog taskLog}) async =>
      dummyTaskLogList.add(taskLog);
}

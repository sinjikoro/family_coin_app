import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

/// MockTaskRepository
class MockTaskRepository extends Mock implements TaskRepository {
  List<Task> dummyTaskList = [];

  @override
  Future<List<Task>> getTaskList({required UserId userId}) async =>
      dummyTaskList;

  @override
  Future<Task> getTask({required TaskId taskId}) async =>
      dummyTaskList.firstWhere((element) => element.id == taskId);

  @override
  Future<void> createTask(Task task) async => dummyTaskList.add(task);

  @override
  Future<void> updateTask({required Task task}) async {
    final index = dummyTaskList.indexWhere((element) => element.id == task.id);
    dummyTaskList[index] = task;
  }

  @override
  Future<void> deleteTask({required TaskId taskId}) async {
    final index = dummyTaskList.indexWhere((element) => element.id == taskId);
    dummyTaskList.removeAt(index);
  }
}

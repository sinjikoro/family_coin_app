import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_state.g.dart';

/// タスク一覧の状態を管理するプロバイダー
@riverpod
class TaskListState extends _$TaskListState {
  final TaskRepository _repository = GetIt.instance<TaskRepository>();

  @override
  FutureOr<List<Task>> build() async => await _fetchTaskList();

  /// タスク一覧を取得する
  Future<List<Task>> _fetchTaskList() async {
    final loggedInUser = await ref.read(loggedInUserStateProvider.future);
    return await _repository.getTaskList(userId: loggedInUser.id);
  }

  /// タスク一覧を取得する
  Future<void> fetchTaskList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _fetchTaskList());
  }

  /// タスクを取得する
  Future<Task> getTask(TaskId taskId) async =>
      await _repository.getTask(taskId: taskId);
}

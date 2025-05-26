import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
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

  /// タスクを作成する
  Future<void> createTask({
    required String name,
    required String description,
    required UserId userId,
    required FamilyCoin earnCoins,
    required Difficulty difficulty,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final loggedInUser = await ref.read(loggedInUserStateProvider.future);

      final task = Task(
        id: TaskId.generate(),
        name: name,
        userId: loggedInUser.id,
        earnCoins: earnCoins,
        registrationStatus: ApprovalStatus.unapproved(),
        description: description,
        difficulty: difficulty,
      );

      await _repository.createTask(task);
      // 一覧を更新
      return await _fetchTaskList();
    });
  }

  /// タスクを更新する
  Future<void> updateTask(
    TaskId id,
    String name,
    String description,
    FamilyCoin earnCoins,
    Difficulty difficulty,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final loggedInUser = await ref.read(loggedInUserStateProvider.future);
      final userId = loggedInUser.id;

      final currentTask = await _repository.getTask(taskId: id);
      if (currentTask.userId != userId) {
        throw ArgumentError('更新対象が自分のタスクではありません');
      }

      final updatedTask = currentTask.copyWith(
        name: name,
        earnCoins: earnCoins,
        description: description,
        difficulty: difficulty,
      );

      await _repository.updateTask(taskId: id, task: updatedTask);
      // 一覧を更新
      return await _fetchTaskList();
    });
  }

  /// タスクを削除する
  Future<void> deleteTask(TaskId id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final loggedInUser = await ref.read(loggedInUserStateProvider.future);
      final userId = loggedInUser.id;

      final task = await _repository.getTask(taskId: id);
      if (task.userId != userId) {
        throw ArgumentError('削除対象が自分のタスクではありません');
      }

      await _repository.deleteTask(taskId: id);
      // 一覧を更新
      return await _fetchTaskList();
    });
  }
}

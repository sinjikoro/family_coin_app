import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/core/exception/exception.dart';
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
  FutureOr<List<Task>> build() async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      return [];
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    return await _repository.getTaskList(userId: userId);
  }

  /// タスク一覧を取得する
  Future<void> fetchTaskList() async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    final taskList = await _repository.getTaskList(userId: userId);
    state = AsyncData(taskList);
  }

  /// タスクを作成する
  Future<void> createTask({
    required String name,
    required String description,
    required Id userId,
    required FamilyCoin earnCoins,
    required Difficulty difficulty,
  }) async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final task = Task(
      id: Id.generate(),
      name: name,
      userId: userId,
      earnCoins: earnCoins,
      registrationStatus: ApprovalStatus.unapproved(),
      description: description,
      difficulty: difficulty,
    );

    await _repository.createTask(task);
    // 一覧を更新
    await fetchTaskList();
  }

  /// タスクを更新する
  Future<void> updateTask(Id id, String name, String description, FamilyCoin earnCoins, Difficulty difficulty) async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;

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
    await fetchTaskList();
  }

  /// タスクを削除する
  Future<void> deleteTask(Id id) async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;

    final task = await _repository.getTask(taskId: id);
    if (task.userId != userId) {
      throw ArgumentError('削除対象が自分のタスクではありません');
    }

    await _repository.deleteTask(taskId: id);
    // 一覧を更新
    await fetchTaskList();
  }
}

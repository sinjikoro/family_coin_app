import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_list_state.g.dart';

/// アクティブなユーザーのタスク一覧
@riverpod
class TaskListState extends _$TaskListState {
  final TaskRepository _repository = GetIt.instance<TaskRepository>();

  @override
  FutureOr<List<Task>> build() async => await _fetchTaskList();

  /// タスク一覧を取得する
  Future<List<Task>> _fetchTaskList() async {
    final activeUser = await ref.read(activeUserStateProvider.future);
    if (activeUser == null) return [];
    return await _repository.getTaskList(userId: activeUser.userId);
  }

  /// タスク一覧を取得する
  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _fetchTaskList());
  }
}

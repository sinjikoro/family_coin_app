import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/domain/model/task/task_log.dart';
import 'package:family_coin/domain/repository/task_log_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_log_list_state.g.dart';

/// タスクログ一覧のState
@riverpod
class TaskLogListState extends _$TaskLogListState {
  final TaskLogRepository _repository = GetIt.instance<TaskLogRepository>();

  @override
  FutureOr<List<TaskLog>> build() async => await _fetchTaskLogList();

  Future<List<TaskLog>> _fetchTaskLogList() async {
    final loggedInUser = await ref.read(loggedInUserStateProvider.future);
    return await _repository.getTaskLogList(userId: loggedInUser.id);
  }

  /// タスクログ一覧を取得する
  Future<void> fetchTaskLogList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchTaskLogList);
  }
}

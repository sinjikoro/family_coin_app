import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/provider/transaction_log_list_state.dart';
import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_user_state.g.dart';

/// アクティブなユーザーのState
@Riverpod(keepAlive: true)
class ActiveUserState extends _$ActiveUserState {
  final UserRepository _repository = GetIt.instance<UserRepository>();

  @override
  FutureOr<User?> build() async {
    // ログインユーザーを初期値として設定
    final loggedInUser = await ref.read(loggedInUserStateProvider.future);
    return loggedInUser;
  }

  /// アクティブなユーザーを設定する
  Future<void> setActiveUser(User user) async {
    // 同じユーザーの場合は更新しない
    if (state.value != null && state.value!.id == user.id) return;

    state = AsyncValue.data(user);
    await Future.wait([
      ref.read(taskListStateProvider.notifier).fetch(),
      ref.read(wishitemListStateProvider.notifier).fetch(),
      ref.read(transactionLogListStateProvider.notifier).fetch(),
    ]);
  }

  /// アクティブなユーザーをリセットする
  Future<void> reset() async {
    state = const AsyncValue.data(null);
    await Future.wait([
      ref.read(taskListStateProvider.notifier).fetch(),
      ref.read(wishitemListStateProvider.notifier).fetch(),
      ref.read(transactionLogListStateProvider.notifier).fetch(),
    ]);
  }

  /// アクティブなユーザーを更新する
  Future<void> refresh() async {
    if (!state.hasValue) return;
    final userId = state.value!.id;
    final activeUser = await _repository.getUser(userId: userId);
    state = AsyncValue.data(activeUser);
    await Future.wait([
      ref.read(userListStateProvider.notifier).fetch(),
      ref.read(taskListStateProvider.notifier).fetch(),
      ref.read(wishitemListStateProvider.notifier).fetch(),
      ref.read(transactionLogListStateProvider.notifier).fetch(),
    ]);
  }
}

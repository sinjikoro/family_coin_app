import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/application/usecase/user/create_user_usecase.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logged_in_user_state.g.dart';

/// ログイン中のユーザー
@riverpod
class LoggedInUserState extends _$LoggedInUserState {
  final SharedPreferences _prefs = GetIt.instance<SharedPreferences>();
  final UserRepository _repository = GetIt.instance<UserRepository>();

  static const String _userIdKey = 'userId';

  @override
  FutureOr<User> build() async => await _fetchUser();

  /// ユーザー情報を取得する
  Future<User> _fetchUser() async {
    final userId = _prefs.getInt(_userIdKey);
    if (userId == null) {
      return await login();
    }
    return await _repository.getUser(userId: UserId(userId));
  }

  /// ユーザー情報の最新を取得する
  Future<void> refresh() async {
    state = AsyncValue.data(await _fetchUser());
  }

  // TODO(naga): ログイン機能を実装する
  /// ログインする
  Future<User> login() async {
    final user = await CreateUserUseCase(
      userListState: ref.read(userListStateProvider.notifier),
    ).execute(name: 'New User');
    await _prefs.setInt(_userIdKey, user.userId.value);
    return user;
  }

  // TODO(naga): ログアウト機能を実装する
  /// ログアウトする
  Future<void> logout() {
    throw UnimplementedError();
  }
}

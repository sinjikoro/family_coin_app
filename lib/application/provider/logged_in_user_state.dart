import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logged_in_user_state.g.dart';

/// ユーザーのNotifier
@riverpod
class LoggedInUserState extends _$LoggedInUserState {
  final SharedPreferences _prefs = GetIt.instance<SharedPreferences>();
  final UserRepository _repository = GetIt.instance<UserRepository>();

  static const String _userIdKey = 'userId';

  @override
  FutureOr<User> build() async {
    final userId = _prefs.getInt(_userIdKey);
    return userId == null
        ? await _createNewUser()
        : await _repository.getUser(userId: UserId(userId));
  }

  /// 新規ユーザーを作成する
  Future<User> _createNewUser() async {
    final newUserId = UserId.generate();
    final user = User(
      id: newUserId,
      name: 'New User',
      familyCoinBalance: const FamilyCoin(0),
    );
    await _repository.createUser(user);
    await _prefs.setInt(_userIdKey, newUserId.value);
    return user;
  }

  // TODO: そのうちログイン、ログアウトを実装する
}

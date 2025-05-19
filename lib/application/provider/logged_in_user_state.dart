import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logged_in_user_state.g.dart';

/// ユーザーのNotifier
@riverpod
class LoggedInUserState extends _$LoggedInUserState {
  final UserRepository _repository = GetIt.instance<UserRepository>();

  @override
  FutureOr<User> build() => User.initial();

  /// ユーザーを取得する
  Future<void> fetchUser() async {
    final user = await _repository.getUser();
    state = AsyncData(user);
  }

  /// ユーザー名を更新する
  Future<void> updateUserName(String name) async {
    final user = await _repository.getUser();
    final updatedUser = user.copyWith(name: name);
    await _repository.saveUser(updatedUser);
    state = AsyncData(updatedUser);
  }

  /// FamilyCoinを追加する
  Future<void> addFamilyCoin(int coin) async {
    final user = await _repository.getUser();
    final updatedUser = user.copyWith(familyCoinBalance: FamilyCoin(user.familyCoinBalance.value + coin));
    await _repository.saveUser(updatedUser);
    state = AsyncData(updatedUser);
  }
}

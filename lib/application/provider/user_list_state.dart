import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_list_state.g.dart';

/// ユーザー一覧のState
@riverpod
class UserListState extends _$UserListState {
  final UserRepository _repository = GetIt.instance<UserRepository>();

  @override
  FutureOr<List<User>> build() async => await _fetchUserList();

  /// ユーザー一覧を取得する
  Future<List<User>> _fetchUserList() async => await _repository.getUserList();

  /// ユーザー一覧を更新する
  Future<void> fetchUserList() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchUserList);
  }

  /// ユーザーを更新する
  Future<void> updateUserName({
    required UserId userId,
    required String name,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await _repository.getUser(userId: userId);
      await _repository.updateUser(
        userId: userId,
        user: user.copyWith(name: name),
      );
      return _fetchUserList();
    });
  }

  /// ユーザーIDでユーザーを取得する
  User? getUserById(UserId userId) => state.value?.firstWhere(
    (user) => user.id == userId,
    orElse: () => throw UserNotFoundException(),
  );

  /// ユーザーのFamilyCoinを更新する
  Future<void> addUserFamilyCoin({
    required UserId userId,
    required FamilyCoin familyCoin,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await _repository.getUser(userId: userId);
      await _repository.updateUser(
        userId: userId,
        user: user.copyWith(
          familyCoinBalance: user.familyCoinBalance + familyCoin,
        ),
      );
      return _fetchUserList();
    });
  }

  /// ユーザーのFamilyCoinを利用する
  Future<void> useUserFamilyCoin({
    required UserId userId,
    required FamilyCoin useCoin,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await _repository.getUser(userId: userId);
      // 残高不足チェック
      if (user.familyCoinBalance < useCoin) {
        throw FamilyCoinNotEnoughException();
      }
      // 更新
      await _repository.updateUser(
        userId: userId,
        user: user.copyWith(
          familyCoinBalance: user.familyCoinBalance - useCoin,
        ),
      );
      return _fetchUserList();
    });
  }

  /// ユーザーのFamilyCoinをリセットする
  Future<void> resetUserFamilyCoin({required UserId userId}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await _repository.getUser(userId: userId);
      await _repository.updateUser(
        userId: userId,
        user: user.copyWith(familyCoinBalance: const FamilyCoin(0)),
      );
      return _fetchUserList();
    });
  }

  /// ユーザーを削除する
  Future<void> deleteUser(UserId userId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      // ログイン中のユーザーは削除できない
      final loggedInUser = await _repository.getUser(userId: userId);
      if (loggedInUser.id == userId) {
        throw LoggedInUserCannotDeleteException();
      }
      // 削除
      await _repository.deleteUser(userId: userId);
      return _fetchUserList();
    });
  }
}

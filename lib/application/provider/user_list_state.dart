import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_list_state.g.dart';

/// ユーザー一覧の状態を管理するプロバイダー
@riverpod
class UserListState extends _$UserListState {
  final UserRepository _repository = GetIt.instance<UserRepository>();

  @override
  FutureOr<List<User>> build() async => await _fetchUserList();

  Future<List<User>> _fetchUserList() async => await _repository.getUserList();

  /// ユーザー一覧を取得する
  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _fetchUserList());
  }
}

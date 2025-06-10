import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ユーザー削除のユースケース
/// ユーザーとその関連データも一緒に削除する
class DeleteUserUseCase {
  /// コンストラクタ
  const DeleteUserUseCase({required this.userListState});

  /// ユーザー一覧のState
  final UserListState userListState;

  /// ユーザーを削除する
  /// ユーザーとその関連データも一緒に削除する
  Future<void> execute({required UserId userId}) async {
    final repository = GetIt.instance<UserRepository>();
    await repository.deleteUserWithRelatedData(userId: userId);
    await userListState.fetch();
  }
}

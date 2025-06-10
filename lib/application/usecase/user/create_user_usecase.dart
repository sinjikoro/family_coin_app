import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ユーザー作成のユースケース
class CreateUserUseCase {
  /// コンストラクタ
  const CreateUserUseCase({required this.userListState});

  /// ユーザー一覧のState
  final UserListState userListState;

  /// ユーザーを作成する
  Future<User> execute({required String name}) async {
    /// ユーザーリポジトリ
    final repository = GetIt.instance<UserRepository>();

    final user = User(
      userId: UserId.generate(),
      name: name,
      familyCoinBalance: const FamilyCoin(0),
    );
    await repository.createUser(user);
    await userListState.fetch();
    return user;
  }
}

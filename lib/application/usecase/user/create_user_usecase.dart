import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ユーザー作成のユースケース
class CreateUserUseCase {
  /// コンストラクタ
  const CreateUserUseCase();

  /// ユーザーを作成する
  Future<User> execute({required String name}) async {
    /// ユーザーリポジトリ
    final repository = GetIt.instance<UserRepository>();

    final user = User(
      id: UserId.generate(),
      name: name,
      familyCoinBalance: const FamilyCoin(0),
    );
    await repository.createUser(user);
    return user;
  }
}

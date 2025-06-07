import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ユーザー名更新のユースケース
class UpdateUserNameUseCase {
  /// コンストラクタ
  const UpdateUserNameUseCase();

  /// ユーザー名を更新する
  Future<void> execute({required UserId userId, required String name}) async {
    final UserRepository repository = GetIt.instance<UserRepository>();
    final user = await repository.getUser(userId: userId);
    await repository.updateUser(
      userId: userId,
      user: user.copyWith(name: name),
    );
  }
}

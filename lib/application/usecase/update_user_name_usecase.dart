import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

/// ユーザー名を更新するユースケース
class UpdateUserNameUseCase {
  /// コンストラクタ
  UpdateUserNameUseCase();

  /// ユーザー名を更新する
  Future<void> execute(String name) async {
    final userRepository = GetIt.instance<UserRepository>();
    final user = await userRepository.getUser();
    final updatedUser = user.copyWith(name: name);
    await userRepository.saveUser(updatedUser);
  }
}

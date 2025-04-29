import 'package:family_coin/domain/repository/user_repository.dart';

/// ユーザー名を更新するユースケース
class UpdateUserNameUseCase {
  /// コンストラクタ
  const UpdateUserNameUseCase(this._userRepository);

  final UserRepository _userRepository;

  /// ユーザー名を更新する
  Future<void> execute(String name) async {
    final user = await _userRepository.getUser();
    final updatedUser = user.copyWith(name: name);
    await _userRepository.saveUser(updatedUser);
  }
}

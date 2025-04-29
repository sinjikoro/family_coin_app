import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';

/// ユーザーのFamilyCoinを更新するユースケース
class UpdateUserCoinUseCase {
  /// コンストラクタ
  const UpdateUserCoinUseCase(this._userRepository);

  final UserRepository _userRepository;

  /// ユーザーのFamilyCoinを更新する
  Future<void> execute(int coin) async {
    final user = await _userRepository.getUser();
    final updatedUser = user.copyWith(familyCoinBalance: FamilyCoin(coin));
    await _userRepository.saveUser(updatedUser);
  }
}

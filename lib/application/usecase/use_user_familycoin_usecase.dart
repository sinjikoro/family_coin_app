import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ユーザーのFamilyCoinを追加するユースケース
class UseUserFamilyCoinUseCase {
  /// コンストラクタ
  const UseUserFamilyCoinUseCase();

  /// ユーザーのFamilyCoinを追加する
  Future<void> execute({
    required UserId userId,
    required FamilyCoin amount,
  }) async {
    final UserRepository userRepository = GetIt.instance<UserRepository>();
    final user = await userRepository.getUser(userId: userId);
    await userRepository.updateUser(
      userId: userId,
      user: user.copyWith(familyCoinBalance: user.familyCoinBalance + amount),
    );
  }
}

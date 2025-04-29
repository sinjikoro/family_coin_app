import 'package:family_coin/domain/model/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

/// ユーザー情報を取得するUseCase
class GetUserInfoUseCase {
  /// Constructor
  const GetUserInfoUseCase();

  /// ユーザー情報を取得する
  Future<User> call() async {
    final userRepository = GetIt.instance<UserRepository>();
    return await userRepository.getUser();
  }
}

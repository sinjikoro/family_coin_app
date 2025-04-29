import 'package:family_coin/domain/model/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';

/// ユーザー情報を取得するUseCase
class GetUserInfoUseCase {
  /// Constructor
  const GetUserInfoUseCase(this._userRepository);

  final UserRepository _userRepository;

  /// ユーザー情報を取得する
  Future<User> call() async => await _userRepository.getUser();
}

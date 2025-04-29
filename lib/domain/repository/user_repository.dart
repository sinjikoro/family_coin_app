import 'package:family_coin/domain/model/user.dart';

/// ユーザーリポジトリ
abstract class UserRepository {
  /// ユーザー情報を取得する
  Future<User> getUser();

  /// ユーザー情報を保存する
  Future<void> saveUser(User user);
}

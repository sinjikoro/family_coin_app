import 'package:family_coin/domain/model/user/user.dart';

/// ユーザークライアント
abstract class UserClient {
  /// ユーザーを取得する
  Future<User> getUser();

  /// ユーザーを更新する
  Future<void> updateUser(User user);

  /// ユーザーを削除する
  Future<void> deleteUser();
}

import 'package:family_coin/domain/model/user.dart';

/// ユーザー情報を保存するデータソース
abstract class UserDataSource {
  /// ユーザー情報を取得する
  Future<User> getUser();

  /// ユーザー情報を保存する
  Future<void> saveUser(User user);
}

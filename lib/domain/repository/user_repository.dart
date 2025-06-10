import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// ユーザーリポジトリ
abstract class UserRepository {
  /// ユーザー一覧を取得する
  Future<List<User>> getUserList();

  /// ユーザー情報を取得する
  Future<User> getUser({required UserId userId});

  /// ユーザーを作成する
  Future<void> createUser(User user);

  /// ユーザーを更新する
  Future<void> updateUser({required UserId userId, required User user});

  /// ユーザーを削除する
  Future<void> deleteUserWithRelatedData({required UserId userId});
}

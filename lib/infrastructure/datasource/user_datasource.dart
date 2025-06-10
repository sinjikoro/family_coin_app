import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/id.dart';

/// ユーザー情報を保存するデータソース
abstract class UserDataSource {
  /// ユーザー情報を取得する
  Future<User> getUser({required UserId userId});

  /// ユーザー情報一覧を取得する
  Future<List<User>> getUserList();

  /// ユーザー情報を作成する
  Future<void> createUser(User user);

  /// ユーザー情報を更新する
  /// 更新対象のuserIdが合致しない場合はエラーを返す
  Future<void> updateUser({required UserId userId, required User user});

  /// ユーザー情報を削除する
  /// 削除対象のuserIdが合致しない場合はエラーを返す
  Future<void> deleteUserWithRelatedData({required UserId userId});
}

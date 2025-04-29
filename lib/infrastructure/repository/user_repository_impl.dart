import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/infrastructure/datasource/user_datasource.dart';

/// UserRepositoryの実装
class UserRepositoryImpl implements UserRepository {
  /// コンストラクタ
  const UserRepositoryImpl(this._dataStore);

  final UserDataSource _dataStore;

  /// ユーザーを取得する
  @override
  Future<User> getUser() async => await _dataStore.getUser();

  /// ユーザーを保存する
  @override
  Future<void> saveUser(User user) async => await _dataStore.saveUser(user);
}

import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/infrastructure/datasource/user_datasource.dart';

/// UserRepositoryの実装
class UserRepositoryImpl implements UserRepository {
  /// コンストラクタ
  const UserRepositoryImpl(this._dataSource);

  final UserDataSource _dataSource;

  @override
  Future<User> getUser({required UserId userId}) async =>
      await _dataSource.getUser(userId: userId);

  @override
  Future<List<User>> getUserList() async => await _dataSource.getUserList();

  @override
  Future<void> createUser(User user) async =>
      await _dataSource.createUser(user);

  @override
  Future<void> updateUser({required UserId userId, required User user}) async =>
      await _dataSource.updateUser(userId: userId, user: user);

  @override
  Future<void> deleteUser({required UserId userId}) async =>
      await _dataSource.deleteUser(userId: userId);
}

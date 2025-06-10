import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

/// MockUserRepository
class MockUserRepository extends Mock implements UserRepository {
  List<User> dummyUserList = [];

  @override
  Future<List<User>> getUserList() async => dummyUserList;

  @override
  Future<User> getUser({required UserId userId}) async =>
      dummyUserList.firstWhere((element) => element.userId == userId);

  @override
  Future<void> createUser(User user) async => dummyUserList.add(user);

  @override
  Future<void> updateUser({required UserId userId, required User user}) async {
    final index = dummyUserList.indexWhere(
      (element) => element.userId == userId,
    );
    dummyUserList[index] = user;
  }

  @override
  Future<void> deleteUserWithRelatedData({required UserId userId}) async {
    final index = dummyUserList.indexWhere(
      (element) => element.userId == userId,
    );
    dummyUserList.removeAt(index);
  }
}

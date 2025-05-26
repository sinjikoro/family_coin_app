import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:mocktail/mocktail.dart';

/// MockUserRepository
class MockUserRepository extends Mock implements UserRepository {
  User dummyUser = const User(
    id: UserId.unassigned(),
    name: 'ダミー　太郎',
    familyCoinBalance: FamilyCoin(100),
  );
}

import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../core/test_utils/mocks/mock_user_repository.dart';

void main() {
  group('LoggedInUserState', () {
    late ProviderContainer container;
    late GetIt getIt;

    setUp(() {
      container = ProviderContainer();
      getIt = GetIt.I..registerSingleton<UserRepository>(MockUserRepository());
    });

    tearDown(() async {
      container.dispose();
      await getIt.reset();
    });

    test('ゲストユーザーの取得', () async {
      final state = await container.read(loggedInUserStateProvider.future);
      expect(state, User.guest());
    });
  });
}

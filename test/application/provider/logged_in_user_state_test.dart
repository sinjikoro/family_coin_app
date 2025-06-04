import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_utils/application_test_helper.dart';

void main() {
  group('LoggedInUserState', () {
    late ApplicationTestHelper helper;

    setUp(() async {
      helper = ApplicationTestHelper();
      await helper.setUp();
    });

    tearDown(() async {
      await helper.tearDown();
    });

    test('ユーザーの取得', () async {
      final state = await helper.container.read(
        loggedInUserStateProvider.future,
      );
      expect(state.id, isNot(const UserId.unassigned()));
      expect(state.name, 'New User');
      expect(state.familyCoinBalance, const FamilyCoin(0));
    });
  });
}

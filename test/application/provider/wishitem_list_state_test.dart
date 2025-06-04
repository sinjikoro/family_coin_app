import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/application/usecase/create_wishitem_usecase.dart';
import 'package:family_coin/application/usecase/delete_wishitem_usecase.dart';
import 'package:family_coin/application/usecase/update_wishitem_usecase.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_utils/application_test_helper.dart';

void main() {
  late ApplicationTestHelper helper;

  group('WishitemListState', () {
    setUp(() async {
      helper = ApplicationTestHelper();
      await helper.setUp();
    });

    tearDown(() async {
      await helper.tearDown();
    });

    test('初期状態は空のリスト', () async {
      final state = await helper.container.read(
        wishitemListStateProvider.future,
      );
      expect(state, []);
    });

    test('ほしいものを追加できる', () async {
      final userId = UserId.generate();
      await CreateWishitemUseCase(
        wishitemListState: helper.container.read(
          wishitemListStateProvider.notifier,
        ),
      ).execute(
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
        userId: userId,
      );

      final state = await helper.container.read(
        wishitemListStateProvider.future,
      );
      expect(state.length, 1);
      expect(state.first.name, 'テストほしいもの');
      expect(state.first.price, const FamilyCoin(100));
      expect(state.first.description, 'テストほしいものの説明');
      expect(state.first.userId, userId);
    });

    test('ほしいものを更新できる', () async {
      await CreateWishitemUseCase(
        wishitemListState: helper.container.read(
          wishitemListStateProvider.notifier,
        ),
      ).execute(
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
        // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
        userId: const UserId.unassigned(),
      );

      final state = await helper.container.read(
        wishitemListStateProvider.future,
      );
      final wishitem = state.first;

      await UpdateWishitemUseCase(
        wishitemListState: helper.container.read(
          wishitemListStateProvider.notifier,
        ),
      ).execute(
        wishitem: wishitem.copyWith(
          name: '更新されたほしいもの',
          description: '更新されたほしいものの説明',
          price: const FamilyCoin(200),
        ),
      );

      expect(state.length, 1);
      expect(state.first.name, '更新されたほしいもの');
      expect(state.first.description, '更新されたほしいものの説明');
      expect(state.first.price, const FamilyCoin(200));
    });

    test('ほしいものを削除できる', () async {
      await CreateWishitemUseCase(
        wishitemListState: helper.container.read(
          wishitemListStateProvider.notifier,
        ),
      ).execute(
        name: 'テストほしいもの',
        description: 'テストほしいものの説明',
        price: const FamilyCoin(100),
        // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
        userId: const UserId.unassigned(),
      );

      final state = await helper.container.read(
        wishitemListStateProvider.future,
      );
      final wishitem = state.first;

      await DeleteWishitemUseCase(
        wishitemListState: helper.container.read(
          wishitemListStateProvider.notifier,
        ),
      ).execute(wishitemId: wishitem.id);

      expect(state.length, 0);
    });
  });
}

import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../core/test_utils/mocks/mock_user_repository.dart';
import '../../core/test_utils/mocks/mock_wishitem_repository.dart';

void main() {
  late ProviderContainer container;
  late GetIt getIt;

  group('WishitemListState', () {
    setUp(() {
      container = ProviderContainer();
      getIt =
          GetIt.I
            ..registerSingleton<UserRepository>(MockUserRepository())
            ..registerSingleton<WishitemRepository>(MockWishitemRepository());
    });

    tearDown(() async {
      container.dispose();
      await getIt.reset();
    });

    test('初期状態は空のリスト', () async {
      final state = await container.read(wishitemListStateProvider.future);
      expect(state, []);
    });

    test('ほしいものを追加できる', () async {
      final userId = UserId.generate();
      await container
          .read(wishitemListStateProvider.notifier)
          .createWishitem(
            name: 'テストほしいもの',
            description: 'テストほしいものの説明',
            price: const FamilyCoin(100),
            userId: userId,
          );

      final state = await container.read(wishitemListStateProvider.future);
      expect(state.length, 1);
      expect(state.first.name, 'テストほしいもの');
      expect(state.first.price, const FamilyCoin(100));
      expect(state.first.description, 'テストほしいものの説明');
      expect(state.first.userId, userId);
    });

    test('ほしいものを更新できる', () async {
      await container
          .read(wishitemListStateProvider.notifier)
          .createWishitem(
            name: 'テストほしいもの',
            description: 'テストほしいものの説明',
            price: const FamilyCoin(100),
            // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
            userId: const UserId.unassigned(),
          );

      final state = await container.read(wishitemListStateProvider.future);
      final wishitem = state.first;

      await container
          .read(wishitemListStateProvider.notifier)
          .updateWishitem(
            wishitemId: wishitem.id,
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
      await container
          .read(wishitemListStateProvider.notifier)
          .createWishitem(
            name: 'テストほしいもの',
            description: 'テストほしいものの説明',
            price: const FamilyCoin(100),
            // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
            userId: const UserId.unassigned(),
          );

      final state = await container.read(wishitemListStateProvider.future);
      final wishitem = state.first;

      await container
          .read(wishitemListStateProvider.notifier)
          .deleteWishitem(wishitemId: wishitem.id);

      expect(state.length, 0);
    });
  });
}

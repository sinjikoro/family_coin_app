import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WishitemListState', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態は空のリスト', () {
      final state = container.read(wishitemListStateProvider);
      expect(state, isEmpty);
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

      final state = container.read(wishitemListStateProvider);
      expect(state.valueOrNull?.length, 1);
      expect(state.valueOrNull?.first.name, 'テストほしいもの');
      expect(state.valueOrNull?.first.price, const FamilyCoin(100));
      expect(state.valueOrNull?.first.description, 'テストほしいものの説明');
      expect(state.valueOrNull?.first.userId, userId);
    });

    test('ほしいものを更新できる', () async {
      final userId = UserId.generate();
      await container
          .read(wishitemListStateProvider.notifier)
          .createWishitem(
            name: 'テストほしいもの',
            description: 'テストほしいものの説明',
            price: const FamilyCoin(100),
            userId: userId,
          );

      final state = container.read(wishitemListStateProvider);
      final wishitem = state.valueOrNull?.first;
      if (wishitem == null) {
        throw Exception('wishitemがnullです');
      }

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

      expect(state.valueOrNull?.length, 1);
      expect(state.valueOrNull?.first.name, '更新されたほしいもの');
      expect(state.valueOrNull?.first.description, '更新されたほしいものの説明');
      expect(state.valueOrNull?.first.price, const FamilyCoin(200));
    });

    test('ほしいものを削除できる', () async {
      final userId = UserId.generate();
      await container
          .read(wishitemListStateProvider.notifier)
          .createWishitem(
            name: 'テストほしいもの',
            description: 'テストほしいものの説明',
            price: const FamilyCoin(100),
            userId: userId,
          );

      final state = container.read(wishitemListStateProvider);
      final wishitem = state.valueOrNull?.first;
      if (wishitem == null) {
        throw Exception('wishitemがnullです');
      }

      await container
          .read(wishitemListStateProvider.notifier)
          .deleteWishitem(wishitemId: wishitem.id);

      expect(state.valueOrNull?.length, 0);
    });
  });
}

import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishitem_list_state.g.dart';

/// ほしいもの一覧の状態を管理するプロバイダー
@riverpod
class WishitemListState extends _$WishitemListState {
  final WishitemRepository _repository = GetIt.instance<WishitemRepository>();

  @override
  FutureOr<List<Wishitem>> build() async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      return [];
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    return await _repository.getWishitemList(userId: userId);
  }

  /// ほしいもの一覧を取得する
  Future<void> fetchWishitemList() async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    final wishitemList = await _repository.getWishitemList(userId: userId);
    state = AsyncData(wishitemList);
  }

  /// ほしいものを作成する
  Future<void> createWishitem({
    required String name,
    required String description,
    required FamilyCoin price,
    Uri? url,
  }) async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    final wishitem = Wishitem(
      id: Id.generate(),
      name: name,
      userId: userId,
      approvalStatus: ApprovalStatus.unapproved(),
      price: price,
      description: description,
      url: url,
    );
    await _repository.createWishitem(wishitem);
    await fetchWishitemList();
  }

  /// ほしいものを更新する
  Future<void> updateWishitem({required Id wishitemId, required Wishitem wishitem}) async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    final currentWishitem = await _repository.getWishitem(wishitemId: wishitemId);
    if (currentWishitem.userId != userId) {
      throw ArgumentError('更新対象が自分のほしいものではありません');
    }
    final updatedWishitem = currentWishitem.copyWith(
      name: wishitem.name,
      description: wishitem.description,
      price: wishitem.price,
      url: wishitem.url,
    );
    await _repository.updateWishitem(wishitemId: wishitemId, wishitem: updatedWishitem);
    await fetchWishitemList();
  }

  /// ほしいものを削除する
  Future<void> deleteWishitem({required Id wishitemId}) async {
    if (ref.read(loggedInUserStateProvider).value == null) {
      throw NotLoggedInException();
    }
    final userId = ref.read(loggedInUserStateProvider).value!.id;
    final currentWishitem = await _repository.getWishitem(wishitemId: wishitemId);
    if (currentWishitem.userId != userId) {
      throw ArgumentError('削除対象が自分のほしいものではありません');
    }
    await _repository.deleteWishitem(wishitemId: wishitemId);
    await fetchWishitemList();
  }
}

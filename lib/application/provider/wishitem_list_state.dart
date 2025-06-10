import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishitem_list_state.g.dart';

/// ほしいもの一覧の状態を管理するプロバイダー
@riverpod
class WishitemListState extends _$WishitemListState {
  final WishitemRepository _repository = GetIt.instance<WishitemRepository>();

  @override
  FutureOr<List<Wishitem>> build() async => await _fetchWishitemList();

  Future<List<Wishitem>> _fetchWishitemList() async {
    final activeUser = await ref.read(activeUserStateProvider.future);
    if (activeUser == null) return [];
    return await _repository.getWishitemList(userId: activeUser.id);
  }

  /// ほしいもの一覧を取得する
  Future<void> fetch() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _fetchWishitemList());
  }
}

import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/repository/wishitem_repository.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:get_it/get_it.dart';

/// ほしいものを作成するユースケース
class CreateWishitemUseCase {
  /// コンストラクタ
  const CreateWishitemUseCase({required this.wishitemListState});

  /// ほしいもの一覧のState
  final WishitemListState wishitemListState;

  /// ほしいものを作成する
  Future<void> execute({
    required String name,
    required String description,
    required UserId userId,
    required FamilyCoin price,
    Uri? url,
  }) async {
    final repository = GetIt.instance<WishitemRepository>();
    final wishitem = Wishitem(
      id: WishitemId.generate(),
      name: name,
      userId: userId,
      approvalStatus: ApprovalStatus.unapproved(),
      price: price,
      description: description,
      url: url,
    );
    await repository.createWishitem(wishitem);
    // 一覧更新
    await wishitemListState.fetchWishitemList();
  }
}

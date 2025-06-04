import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/application/usecase/update_wishitem_usecase.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_form_widget.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_read_only_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ほしいもの詳細
class WishitemDetailPage extends ConsumerStatefulWidget {
  /// constructor
  const WishitemDetailPage({required this.wishitemId, super.key});

  /// ほしいものID
  final WishitemId wishitemId;

  @override
  ConsumerState<WishitemDetailPage> createState() => _WishitemDetailPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Id>('wishitemId', wishitemId));
  }
}

class _WishitemDetailPageState extends ConsumerState<WishitemDetailPage> {
  /// 編集モード
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final wishitemAsync = ref.watch(
      wishitemListStateProvider.select(
        (wishitems) => wishitems.value?.firstWhere(
          (wishitem) => wishitem.id == widget.wishitemId,
          orElse: () => throw Exception('ほしいものが見つかりません'),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(wishitemAsync?.name ?? ''),
        actions: [
          if (!isEditing)
            IconButton(icon: const Icon(Icons.edit), onPressed: toggleEditing),
        ],
      ),
      body: _buildBody(wishitemAsync),
    );
  }

  /// 編集モードを切り替える
  void toggleEditing() => setState(() => isEditing = !isEditing);

  /// ほしいものを更新する
  Future<void> _updateWishitem({
    required String name,
    required String description,
    required FamilyCoin price,
    Uri? url,
  }) async {
    try {
      final currentWishitem = await ref
          .read(wishitemListStateProvider.notifier)
          .getWishitem(widget.wishitemId);
      final updatedWishitem = currentWishitem.copyWith(
        name: name,
        description: description,
        price: price,
        url: url,
      );
      await UpdateWishitemUseCase(
        wishitemListState: ref.read(wishitemListStateProvider.notifier),
      ).execute(wishitem: updatedWishitem);
      if (mounted) {
        toggleEditing();
      }
    } on NotLoggedInException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.error(e.toString()))),
        );
      }
    }
  }

  /// ボディWidget
  Widget _buildBody(Wishitem? wishitem) {
    if (wishitem == null) {
      return const Center(child: Text('ほしいものが見つかりません'));
    }

    if (isEditing) {
      return WishitemFormWidget(
        wishitem: wishitem,
        onSave: _updateWishitem,
        onCancel: toggleEditing,
      );
    }

    return WishitemReadOnlyWidget(
      wishitemName: wishitem.name,
      wishitemDescription: wishitem.description,
      wishitemPrice: wishitem.price,
      wishitemUrl: wishitem.url,
      wishitemApprovalStatus: wishitem.approvalStatus,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isEditing', isEditing));
  }
}

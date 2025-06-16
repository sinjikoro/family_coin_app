import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/application/usecase/wishitem/delete_wishitem_usecase.dart';
import 'package:family_coin/application/usecase/wishitem/get_wishitem_usecase.dart';
import 'package:family_coin/application/usecase/wishitem/update_wishitem_usecase.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/common/pages/error_page.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_form_widget.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_read_only_widget.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ほしいもの詳細
class WishitemDetailPage extends StatelessWidget {
  /// constructor
  const WishitemDetailPage({required this.wishitemId, super.key});

  /// ほしいものID
  final WishitemId wishitemId;

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: const GetWishitemUseCase().execute(wishitemId),
    builder: (context, wishitem) {
      switch (wishitem.connectionState) {
        case ConnectionState.done:
          return wishitem.hasData
              ? _WishitemDetailPage(wishitem: wishitem.data!)
              : ErrorPage(errorMessage: context.l10n.errorUnexpected);
        case ConnectionState.waiting:
        case ConnectionState.none:
        case ConnectionState.active:
          return const Center(child: CircularProgressIndicator());
      }
    },
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WishitemId>('wishitemId', wishitemId));
  }
}

/// ほしいもの詳細ページ
class _WishitemDetailPage extends ConsumerStatefulWidget {
  /// constructor
  const _WishitemDetailPage({required this.wishitem});

  /// ほしいもの
  final Wishitem wishitem;

  @override
  ConsumerState<_WishitemDetailPage> createState() =>
      _WishitemDetailPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Wishitem>('wishitem', wishitem));
  }
}

class _WishitemDetailPageState extends ConsumerState<_WishitemDetailPage> {
  /// 編集モード
  bool isEditing = false;
  Wishitem _currentWishitem = Wishitem.initial(const UserId.unassigned());

  @override
  void initState() {
    super.initState();
    _currentWishitem = widget.wishitem;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_currentWishitem.name),
      actions: [
        if (!isEditing)
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteWishitem,
          ),
      ],
    ),
    body:
        isEditing
            ? WishitemFormWidget(
              wishitem: widget.wishitem,
              onSave: _updateWishitem,
              onCancel: _toggleEditing,
            )
            : WishitemReadOnlyWidget(
              wishitemName: _currentWishitem.name,
              wishitemDescription: _currentWishitem.description,
              wishitemPrice: _currentWishitem.price,
              wishitemUrl: _currentWishitem.url,
            ),
    floatingActionButton: FloatingActionButton(
      onPressed: _toggleEditing,
      child: const Icon(Icons.edit),
    ),
  );

  /// 編集モードを切り替える
  void _toggleEditing() => setState(() => isEditing = !isEditing);

  /// ほしいものを削除する
  Future<void> _deleteWishitem() async {
    final wishitemListState = ref.read(wishitemListStateProvider.notifier);
    await DeleteWishitemUseCase(
      wishitemListState: wishitemListState,
    ).execute(wishitemId: widget.wishitem.wishItemId);
    if (mounted) {
      context.pop();
    }
  }

  /// ほしいものを更新する
  Future<void> _updateWishitem({
    required String name,
    required String description,
    required FamilyCoin price,
    Uri? url,
  }) async {
    final updatedWishitem = widget.wishitem.copyWith(
      name: name,
      description: description,
      price: price,
      url: url,
    );
    await UpdateWishitemUseCase(
      wishitemListState: ref.read(wishitemListStateProvider.notifier),
    ).execute(wishitem: updatedWishitem);
    if (mounted) {
      _toggleEditing();
      _currentWishitem = updatedWishitem;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isEditing', isEditing));
  }
}

import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/application/usecase/wishitem/create_wishitem_usecase.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/presentation/ui/common/pages/error_page.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ほしいもの作成ページ
class WishitemCreatePage extends ConsumerWidget {
  /// Constructor
  const WishitemCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeUser = ref.read(activeUserStateProvider).value;
    if (activeUser == null) {
      return ErrorPage(errorMessage: context.l10n.errorUnexpected);
    }
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.wishitemCreateTitle)),
      body: WishitemFormWidget(
        wishitem: Wishitem.initial(activeUser.userId),
        onSave: ({
          required name,
          required description,
          required price,
          url,
        }) async {
          try {
            await CreateWishitemUseCase(
              wishitemListState: ref.read(wishitemListStateProvider.notifier),
            ).execute(
              name: name,
              description: description,
              userId: activeUser.userId,
              price: price,
              url: url,
            );
            if (context.mounted) {
              context.pop();
            }
          } on NotLoggedInException catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.error(e.toString()))),
              );
            }
          }
        },
        onCancel: () => context.pop(),
      ),
    );
  }
}

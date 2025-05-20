import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ほしいもの作成ページ
class WishitemCreatePage extends ConsumerWidget {
  /// constructor
  const WishitemCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(loggedInUserStateProvider).value?.id ?? Id.generate();
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.wishitemCreateTitle)),
      body: WishitemFormWidget(
        wishitem: Wishitem.initial(userId),
        onSave: ({required name, required description, required price, url}) async {
          try {
            await ref
                .read(wishitemListStateProvider.notifier)
                .createWishitem(name: name, description: description, userId: userId, price: price, url: url);
            if (context.mounted) {
              context.pop();
            }
          } on NotLoggedInException catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.error(e.toString()))));
            }
          }
        },
        onCancel: () => context.pop(),
      ),
    );
  }
}

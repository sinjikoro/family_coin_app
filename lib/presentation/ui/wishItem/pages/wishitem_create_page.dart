import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/application/usecase/wishitem/create_wishitem_usecase.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/common/pages/error_page.dart';
import 'package:family_coin/presentation/ui/wishItem/widgets/wishitem_form_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// ほしいもの作成ページ
class WishitemCreatePage extends ConsumerWidget {
  /// constructor
  const WishitemCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder(
    future: ref.read(loggedInUserStateProvider.future),
    builder: (context, user) {
      switch (user.connectionState) {
        case ConnectionState.done:
          return user.hasData
              ? _WishitemCreatePage(userId: user.data!.id)
              : ErrorPage(errorMessage: context.l10n.unexpectedError);
        case ConnectionState.waiting:
        case ConnectionState.none:
        case ConnectionState.active:
          return const Center(child: CircularProgressIndicator());
      }
    },
  );
}

class _WishitemCreatePage extends ConsumerWidget {
  const _WishitemCreatePage({required this.userId});

  final UserId userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.wishitemCreateTitle)),
    body: WishitemFormWidget(
      wishitem: Wishitem.initial(userId),
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
            userId: userId,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<UserId>('userId', userId));
  }
}

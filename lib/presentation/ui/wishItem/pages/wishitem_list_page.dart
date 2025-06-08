import 'package:family_coin/application/provider/exchanged_record_list_state.dart';
import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/application/usecase/wishitem/exchange_wishitem_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/error/domain_error.dart';
import 'package:family_coin/domain/error/error_code.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/presentation/routing/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

/// ほしいもの一覧
class WishitemListPage extends ConsumerStatefulWidget {
  /// constructor
  const WishitemListPage({super.key});

  @override
  ConsumerState<WishitemListPage> createState() => _WishitemListPageState();
}

class _WishitemListPageState extends ConsumerState<WishitemListPage> {
  @override
  Widget build(BuildContext context) {
    final wishitemListAsync = ref.watch(wishitemListStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.wishitemListTitle)),
      body: RefreshIndicator(
        onRefresh:
            () async =>
                await ref
                    .read(wishitemListStateProvider.notifier)
                    .fetchWishitemList(),
        child: wishitemListAsync.when(
          data:
              (wishitems) => ListView.builder(
                itemCount: wishitems.length,
                itemBuilder: (context, index) {
                  final wishitem = wishitems[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      extentRatio: 0.3,
                      children: [
                        SlidableAction(
                          onPressed:
                              (context) async =>
                                  await _exchangeWishitem(context, wishitem),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          icon: Icons.currency_exchange,
                          label: context.l10n.wishItemExchange,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(wishitem.name),
                      subtitle: Text(wishitem.price.toString()),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap:
                          () async => await context.push(
                            RoutePath.wishItemDetail(wishitem.id),
                          ),
                    ),
                  );
                },
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (error, stackTrace) =>
                  Center(child: Text(context.l10n.error(error.toString()))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await context.push(RoutePath.wishItemCreate),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// ほしいものを購入する
  Future<void> _exchangeWishitem(
    BuildContext context,
    Wishitem wishitem,
  ) async {
    try {
      final loggedInUser = await ref.read(loggedInUserStateProvider.future);
      final exchangedRecordListState = ref.read(
        exchangedRecordListStateProvider.notifier,
      );
      await ExchangeWishitemUseCase(
        exchangedRecordListState: exchangedRecordListState,
      ).execute(user: loggedInUser, wishitem: wishitem);
    } on DomainError catch (e) {
      if (context.mounted) {
        if (e.code == ErrorCode.familyCoinNegative) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.errorNotEnoughCoins)),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.error(e.code))));
        }
      }
    }
  }
}

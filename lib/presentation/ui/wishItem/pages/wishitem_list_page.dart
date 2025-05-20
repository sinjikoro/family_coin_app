import 'package:family_coin/application/provider/wishitem_list_state.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/presentation/routing/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        onRefresh: () async => await ref.read(wishitemListStateProvider.notifier).fetchWishitemList(),
        child: wishitemListAsync.when(
          data:
              (wishitems) => ListView.builder(
                itemCount: wishitems.length,
                itemBuilder: (context, index) {
                  final wishitem = wishitems[index];
                  return ListTile(
                    title: Text(wishitem.name),
                    subtitle: Text(wishitem.price.toString()),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async => await context.push(RoutePath.wishItemDetail(wishitem.id)),
                  );
                },
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text(context.l10n.error(error.toString()))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await context.push(RoutePath.wishItemCreate),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ほしいもの一覧
class WishitemList extends ConsumerWidget {
  /// constructor
  const WishitemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サンプルタスクデータ
    const wishItems = [
      {'id': 1, 'title': 'ゲーム', 'price': 5000},
      {'id': 2, 'title': 'おもちゃ', 'price': 1000},
      {'id': 3, 'title': 'お菓子', 'price': 100},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('タスク一覧')),
      body: ListView.builder(
        itemCount: wishItems.length,
        itemBuilder: (context, index) {
          final wishItem = wishItems[index];
          return ListTile(
            title: Text(wishItem['title']! as String),
            subtitle: Text("${wishItem['price']}コイン"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap:
                () async => await WishitemDetailRoute(
                  id: wishItem['id']! as int,
                ).push(context),
          );
        },
      ),
    );
  }
}

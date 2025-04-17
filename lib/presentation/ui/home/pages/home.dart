import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Home画面
class Home extends ConsumerWidget {
  /// Constructor
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('Home')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('現在のコイン残高: 100枚', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async => await const TaskListRoute().push(context),
            child: const Text('タスク一覧'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed:
                () async => await const WishitemListRoute().push(context),
            child: const Text('ほしいもの一覧'),
          ),
        ],
      ),
    ),
  );
}

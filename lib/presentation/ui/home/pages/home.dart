import 'package:family_coin/presentation/providers/home_provider.dart';
import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home画面
class Home extends ConsumerWidget {
  /// Constructor
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userAsyncValue.when(
              data:
                  (user) =>
                      user != null
                          ? Column(
                            children: [
                              Text(
                                'ユーザー名: ${user.name}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '現在のコイン残高: ${user.familyCoinBalance}枚',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                          : const Text('ユーザー情報がありません'),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('エラー: $error'),
            ),
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
}

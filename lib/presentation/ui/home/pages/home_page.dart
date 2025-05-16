import 'package:family_coin/application/provider/user_state.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home画面
class HomePage extends ConsumerStatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async => await ref.read(userStateProvider.notifier).fetchUser());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(userStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            userProvider.when(
              data:
                  (user) => Column(
                    children: [
                      Text(user.name, style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      Text(
                        context.l10n.homeCoinBalance(user.familyCoinBalance.value),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('エラー: $error'),
            ),
            ElevatedButton(
              onPressed: () async => await const TaskListRoute().push(context),
              child: const Text('タスク一覧'),
            ),
            ElevatedButton(
              onPressed: () async => await const WishitemListRoute().push(context),
              child: const Text('ほしいもの一覧'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await ref.read(userStateProvider.notifier).addFamilyCoin(10),
        child: const Icon(Icons.add),
      ),
    );
  }
}

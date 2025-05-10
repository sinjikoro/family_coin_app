import 'package:family_coin/presentation/providers/home_provider.dart';
import 'package:family_coin/presentation/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home画面
class Home extends ConsumerStatefulWidget {
  /// Constructor
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeAsyncValue = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            homeAsyncValue.when(
              data:
                  (state) =>
                      state.user != null
                          ? Column(
                            children: [
                              TextField(
                                controller: _textEditingController..text = state.user!.name,
                                style: const TextStyle(fontSize: 18),
                                onSubmitted: (value) async {
                                  await ref.read(homeProvider.notifier).updateUserName(value);
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(L10n.of(context)!.helloWorld),
                              Text(
                                '現在のコイン残高: ${state.user!.familyCoinBalance.value}枚',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                          : const Text('ユーザー情報がありません'),
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
    );
  }
}

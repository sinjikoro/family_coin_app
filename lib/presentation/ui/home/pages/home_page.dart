import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/presentation/routing/route_path.dart';
import 'package:family_coin/presentation/ui/home/widgets/account_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    Future.microtask(
      () async =>
          await ref.read(loggedInUserStateProvider.notifier).fetchUser(),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(loggedInUserStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.homeTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            userProvider.when(
              data:
                  (user) => AccountCard(
                    name: user.name,
                    balance: user.familyCoinBalance.value,
                  ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('エラー: $error'),
            ),
            ElevatedButton(
              onPressed: () async => await context.push(RoutePath.taskList),
              child: const Text('タスク一覧'),
            ),
            ElevatedButton(
              onPressed: () async => await context.push(RoutePath.wishItemList),
              child: const Text('ほしいもの一覧'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () async => await ref
                .read(loggedInUserStateProvider.notifier)
                .addFamilyCoin(10),
        child: const Icon(Icons.add),
      ),
    );
  }
}

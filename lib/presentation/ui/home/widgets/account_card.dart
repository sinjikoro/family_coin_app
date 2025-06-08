import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/usecase/user/update_user_name_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/presentation/ui/common/widgets/tappable_editable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アカウントカード
class AccountCard extends ConsumerStatefulWidget {
  /// constructor
  const AccountCard({super.key});

  @override
  ConsumerState<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends ConsumerState<AccountCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder(
      future: ref.watch(loggedInUserStateProvider.future),
      builder: (context, asyncUser) {
        switch (asyncUser.connectionState) {
          case ConnectionState.done:
            if (asyncUser.hasData) {
              final user = asyncUser.data!;
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        theme.colorScheme.primaryContainer,
                        theme.colorScheme.primaryContainer.withAlpha(204),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: theme.colorScheme.onPrimaryContainer,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          TappableEditableText(
                            text: user.name,
                            onChanged: (name) => _onNameChanged(ref, name),
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '残高',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer
                                  .withAlpha(204),
                            ),
                          ),
                          Text(
                            '${user.familyCoinBalance.value} コイン',
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text(context.l10n.errorNotFoundData));
            }
          case ConnectionState.waiting:
          case ConnectionState.none:
          case ConnectionState.active:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  /// 名前変更時のコールバック
  Future<void> _onNameChanged(WidgetRef ref, String name) async {
    // ログイン中のユーザー取得
    final loggedInUser = ref.read(loggedInUserStateProvider);
    // 名前変更
    await const UpdateUserNameUseCase().execute(
      userId: loggedInUser.value!.id,
      name: name,
    );
    // ユーザー情報を更新
    await ref.read(loggedInUserStateProvider.notifier).refresh();
  }
}

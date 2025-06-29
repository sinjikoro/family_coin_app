import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/application/usecase/user/create_user_usecase.dart';
import 'package:family_coin/application/usecase/user/delete_user_usecase.dart';
import 'package:family_coin/application/usecase/user/update_user_name_usecase.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/presentation/ui/components/atoms/tappable_editable_text.dart';
import 'package:family_coin/presentation/ui/components/organisms/account_history_sheet.dart';
import 'package:family_coin/presentation/ui/pages/error_page.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
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
  Widget build(BuildContext context) => FutureBuilder(
    future: Future.wait([
      ref.watch(userListStateProvider.future),
      ref.read(activeUserStateProvider.future),
    ]),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.done:
          // データが正常に取得できない場合はエラーページを表示
          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.length < 2) {
            return Center(
              child: ErrorPage(errorMessage: context.l10n.errorUnexpected),
            );
          }
          // userListStateProvider
          final userList = snapshot.data![0]! as List<User>;
          // activeUserStateProvider
          final activeUser = snapshot.data![1] as User?;

          return PageView.builder(
            itemCount: userList.length + 1, // ユーザー追加カードがあるので + 1
            controller: PageController(
              // activeUserに初期位置を設定
              initialPage:
                  activeUser != null
                      ? userList.indexWhere(
                        (user) => user.userId == activeUser.userId,
                      )
                      : 0,
            ),
            onPageChanged: (index) => _onPageViewSwiped(index, userList),
            itemBuilder: (context, index) {
              // userList.lengthまではユーザーカード、+1の分はユーザー追加カード
              if (index < userList.length) {
                final user = userList[index];
                return _UserCard(
                  user: user,
                  onNameChanged: _updateUserName,
                  onTap: _showAccountHistorySheet,
                  onDelete: () => _deleteUser(user),
                );
              }
              return _EmptyCard(onTap: _addUser);
            },
          );
        case ConnectionState.none:
        case ConnectionState.waiting:
        case ConnectionState.active:
          return const Center(child: CircularProgressIndicator());
      }
    },
  );

  /// 名前変更時のコールバック
  Future<void> _updateUserName(String name) async {
    // ログイン中のユーザー取得
    final activeUser = await ref.read(activeUserStateProvider.future);
    if (activeUser == null) return;
    // 名前変更
    await const UpdateUserNameUseCase().execute(
      userId: activeUser.userId,
      name: name,
    );
    // ユーザー情報を更新
    await ref.read(activeUserStateProvider.notifier).refresh();
  }

  /// アカウント履歴シートを表示
  Future<void> _showAccountHistorySheet() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const AccountHistorySheet(),
    );
  }

  /// ユーザー追加時のコールバック
  Future<void> _addUser() async {
    final user = await CreateUserUseCase(
      userListState: ref.read(userListStateProvider.notifier),
    ).execute(name: 'New User');
    await ref.read(activeUserStateProvider.notifier).setActiveUser(user);
  }

  /// ユーザー削除時のコールバック
  Future<void> _deleteUser(User user) async {
    // ユーザー削除
    await DeleteUserUseCase(
      userListState: ref.read(userListStateProvider.notifier),
    ).execute(userId: user.userId);
    final loggedInUser = await ref.read(activeUserStateProvider.future);
    await ref
        .read(activeUserStateProvider.notifier)
        .setActiveUser(loggedInUser!);
    await ref.read(userListStateProvider.notifier).fetch();
  }

  /// ページビューをスワイプした時のコールバック
  Future<void> _onPageViewSwiped(int index, List<User> userList) async {
    // 最後のカード（空のカード）以外の場合
    if (index < userList.length) {
      final user = userList[index];
      await ref.read(activeUserStateProvider.notifier).setActiveUser(user);
    } else {
      await ref.read(activeUserStateProvider.notifier).reset();
    }
  }
}

/// アカウントカード
class _UserCard extends StatelessWidget {
  const _UserCard({
    required this.user,
    required this.onNameChanged,
    required this.onTap,
    required this.onDelete,
  });

  final User user;
  final Function(String) onNameChanged;
  final Function() onTap;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                    onChanged: onNameChanged,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  _CardMenu(onDelete: onDelete),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '残高',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withAlpha(
                        204,
                      ),
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
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<User>('user', user))
      ..add(
        ObjectFlagProperty<Function(String p1)>.has(
          'onNameChanged',
          onNameChanged,
        ),
      )
      ..add(ObjectFlagProperty<Function()>.has('onTap', onTap))
      ..add(ObjectFlagProperty<Function()>.has('onDelete', onDelete));
  }
}

/// カードメニュー
class _CardMenu extends StatelessWidget {
  const _CardMenu({required this.onDelete});

  static const _delete = 'delete';

  /// 削除時のコールバック
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: theme.colorScheme.onPrimaryContainer),
      onSelected: (value) {
        switch (value) {
          case _delete:
            onDelete();
        }
      },
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: _delete,
              child: Row(
                children: [
                  Icon(Icons.delete, size: 20, color: theme.colorScheme.error),
                  const SizedBox(width: 8),
                  Text('削除', style: TextStyle(color: theme.colorScheme.error)),
                ],
              ),
            ),
          ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<Function()>.has('onDelete', onDelete));
  }
}

/// 空のカード
class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.all(16),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text('ユーザーを追加', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}

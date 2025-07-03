import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:family_coin/presentation/ui/components/organisms/account_card.dart';
import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/mocks/mock_active_user_state.dart';
import 'package:widgetbook_workspace/utils/mocks/mock_user_list_state.dart';

// モックユーザーデータ
final _mockUsers = [
  User(userId: UserId(1), name: '田中太郎', familyCoinBalance: FamilyCoin(150)),
  User(userId: UserId(2), name: '田中花子', familyCoinBalance: FamilyCoin(300)),
  User(userId: UserId(3), name: '田中次郎', familyCoinBalance: FamilyCoin(75)),
];

@widgetbook.UseCase(name: 'Default', type: AccountCard)
Widget accountCardUseCase(BuildContext context) {
  return ProviderScope(
    overrides: [
      userListStateProvider.overrideWith(() => MockUserListState(_mockUsers)),
      activeUserStateProvider.overrideWith(
        () => MockActiveUserState(_mockUsers.first),
      ),
    ],
    child: const AccountCard(),
  );
}

@widgetbook.UseCase(name: 'Multiple Users', type: AccountCard)
Widget accountCardMultipleUsersUseCase(BuildContext context) {
  return ProviderScope(
    overrides: [
      userListStateProvider.overrideWith(() => MockUserListState(_mockUsers)),
      activeUserStateProvider.overrideWith(
        () => MockActiveUserState(_mockUsers.first),
      ),
    ],
    child: const AccountCard(),
  );
}

@widgetbook.UseCase(name: 'High Balance User', type: AccountCard)
Widget accountCardHighBalanceUseCase(BuildContext context) {
  final highBalanceUsers = [
    User(userId: UserId(1), name: '田中太郎', familyCoinBalance: FamilyCoin(1000)),
  ];

  return ProviderScope(
    overrides: [
      userListStateProvider.overrideWith(
        () => MockUserListState(highBalanceUsers),
      ),
      activeUserStateProvider.overrideWith(
        () => MockActiveUserState(highBalanceUsers.first),
      ),
    ],
    child: const AccountCard(),
  );
}

@widgetbook.UseCase(name: 'Zero Balance User', type: AccountCard)
Widget accountCardZeroBalanceUseCase(BuildContext context) {
  final zeroBalanceUsers = [
    User(userId: UserId(1), name: '田中太郎', familyCoinBalance: FamilyCoin(0)),
  ];

  return ProviderScope(
    overrides: [
      userListStateProvider.overrideWith(
        () => MockUserListState(zeroBalanceUsers),
      ),
      activeUserStateProvider.overrideWith(
        () => MockActiveUserState(zeroBalanceUsers.first),
      ),
    ],
    child: const AccountCard(),
  );
}

// TODO(naga) : ローディングとエラー時の画面を表示する
// @widgetbook.UseCase(name: 'Loading State', type: AccountCard)
// Widget accountCardLoadingUseCase(BuildContext context) {
//   return ProviderScope(
//     overrides: [
//       userListStateProvider.overrideWith(
//         () {
//           Future.delayed(
//           const Duration(seconds: 2),
//         }
//           () => MockUserListState(_mockUsers),
//         ),
//       ),
//       activeUserStateProvider.overrideWith(
//         () => Future.delayed(
//           const Duration(seconds: 2),
//           () => MockActiveUserState(_mockUsers.first),
//         ),
//       ),
//     ],
//     child: const AccountCard(),
//   );
// }

// @widgetbook.UseCase(name: 'Error State', type: AccountCard)
// Widget accountCardErrorUseCase(BuildContext context) {
//   return ProviderScope(
//     overrides: [
//       userListStateProvider.overrideWith(
//         () => Future.delayed(
//           const Duration(milliseconds: 500),
//           () => throw Exception('Failed to load users'),
//         ),
//       ),
//       activeUserStateProvider.overrideWith(
//         () => Future.delayed(
//           const Duration(milliseconds: 300),
//           () => throw Exception('Failed to load active user'),
//         ),
//       ),
//     ],
//     child: const AccountCard(),
//   );
// }

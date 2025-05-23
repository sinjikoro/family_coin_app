import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/domain/repository/task_repository.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../core/test_utils/mocks/mock_task_repository.dart';
import '../../core/test_utils/mocks/mock_user_repository.dart';

void main() {
  group('TaskListState', () {
    late ProviderContainer container;
    late GetIt getIt;

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      container = ProviderContainer();
      getIt =
          GetIt.I
            ..registerSingleton<UserRepository>(MockUserRepository())
            ..registerSingleton<TaskRepository>(MockTaskRepository());
    });

    tearDown(() async {
      container.dispose();
      await getIt.reset();
    });

    test('初期状態は空のリスト', () async {
      final state = await container.read(taskListStateProvider.future);
      expect(state, []);
    });

    test('タスクを追加できる', () async {
      final userId = UserId.generate();
      await container
          .read(taskListStateProvider.notifier)
          .createTask(
            name: 'テストタスク',
            description: 'テストタスクの説明',
            userId: userId,
            earnCoins: const FamilyCoin(10),
            difficulty: Difficulty.easy,
          );

      final state = await container.read(taskListStateProvider.future);
      expect(state.length, 1);
      expect(state.first.name, 'テストタスク');
      expect(state.first.earnCoins, const FamilyCoin(10));
      expect(state.first.description, 'テストタスクの説明');
      expect(state.first.userId, userId);
      expect(state.first.difficulty, Difficulty.easy);
      expect(state.first.registrationStatus, ApprovalStatus.unapproved());
    });

    test('タスクを更新できる', () async {
      await container
          .read(taskListStateProvider.notifier)
          .createTask(
            name: 'テストタスク',
            description: 'テストタスクの説明',
            // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
            userId: const UserId.unassigned(),
            earnCoins: const FamilyCoin(10),
            difficulty: Difficulty.easy,
          );

      final state = await container.read(taskListStateProvider.future);
      final task = state.first;

      await container
          .read(taskListStateProvider.notifier)
          .updateTask(
            task.id,
            '更新されたタスク',
            '更新されたタスクの説明',
            const FamilyCoin(20),
            Difficulty.normal,
          );

      expect(state.length, 1);
      expect(state.first.name, '更新されたタスク');
      expect(state.first.description, '更新されたタスクの説明');
      expect(state.first.earnCoins, const FamilyCoin(20));
      expect(state.first.difficulty, Difficulty.normal);
    });

    test('タスクを削除できる', () async {
      await container
          .read(taskListStateProvider.notifier)
          .createTask(
            name: 'テストタスク',
            description: 'テストタスクの説明',
            // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
            userId: const UserId.unassigned(),
            earnCoins: const FamilyCoin(10),
            difficulty: Difficulty.easy,
          );

      final state = await container.read(taskListStateProvider.future);
      final task = state.first;

      await container.read(taskListStateProvider.notifier).deleteTask(task.id);

      expect(state.length, 0);
    });
  });
}

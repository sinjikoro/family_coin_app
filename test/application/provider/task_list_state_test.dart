import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/usecase/task/create_task_usecase.dart';
import 'package:family_coin/application/usecase/task/delete_task_usecase.dart';
import 'package:family_coin/application/usecase/task/update_task_usecase.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_utils/application_test_helper.dart';

void main() {
  group('TaskListState', () {
    late ApplicationTestHelper helper;

    setUp(() async {
      helper = ApplicationTestHelper();
      await helper.setUp();
    });

    tearDown(() async {
      await helper.tearDown();
    });

    test('初期状態は空のリスト', () async {
      final state = await helper.container.read(taskListStateProvider.future);
      expect(state, []);
    });

    test('タスクを追加できる', () async {
      final userId = UserId.generate();
      await CreateTaskUseCase(
        taskListState: helper.container.read(taskListStateProvider.notifier),
      ).execute(
        name: 'テストタスク',
        description: 'テストタスクの説明',
        userId: userId,
        earnCoins: const FamilyCoin(10),
        difficulty: Difficulty.easy,
      );

      final state = await helper.container.read(taskListStateProvider.future);
      expect(state.length, 1);
      expect(state.first.name, 'テストタスク');
      expect(state.first.earnCoins, const FamilyCoin(10));
      expect(state.first.description, 'テストタスクの説明');
      expect(state.first.userId, userId);
      expect(state.first.difficulty, Difficulty.easy);
    });

    test('タスクを更新できる', () async {
      await CreateTaskUseCase(
        taskListState: helper.container.read(taskListStateProvider.notifier),
      ).execute(
        name: 'テストタスク',
        description: 'テストタスクの説明',
        userId: const UserId.unassigned(),
        earnCoins: const FamilyCoin(10),
        difficulty: Difficulty.easy,
      );

      final state = await helper.container.read(taskListStateProvider.future);
      final task = state.first;

      await UpdateTaskUseCase(
        taskListState: helper.container.read(taskListStateProvider.notifier),
      ).execute(
        task: task.copyWith(
          name: '更新されたタスク',
          description: '更新されたタスクの説明',
          earnCoins: const FamilyCoin(20),
          difficulty: Difficulty.normal,
        ),
      );

      expect(state.length, 1);
      expect(state.first.name, '更新されたタスク');
      expect(state.first.description, '更新されたタスクの説明');
      expect(state.first.earnCoins, const FamilyCoin(20));
      expect(state.first.difficulty, Difficulty.normal);
    });

    test('タスクを削除できる', () async {
      await CreateTaskUseCase(
        taskListState: helper.container.read(taskListStateProvider.notifier),
      ).execute(
        name: 'テストタスク',
        description: 'テストタスクの説明',
        // UserProvider内で自動生成されるUserIdと紐づけさせる仕組みを用意していない為、UserId.unassigned()を利用
        userId: const UserId.unassigned(),
        earnCoins: const FamilyCoin(10),
        difficulty: Difficulty.easy,
      );

      final state = await helper.container.read(taskListStateProvider.future);
      final task = state.first;

      await DeleteTaskUseCase(
        taskListState: helper.container.read(taskListStateProvider.notifier),
      ).execute(taskId: task.taskId);

      expect(state.length, 0);
    });
  });
}

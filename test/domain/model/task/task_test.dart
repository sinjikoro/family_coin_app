import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task', () {
    test('正常な値でTaskを生成できる', () {
      final task = Task(
        taskId: TaskId.generate(),
        userId: UserId.generate(),
        name: 'テストタスク',
        description: 'テストタスクの説明',
        earnCoins: const FamilyCoin(10),
        difficulty: Difficulty.easy,
      );

      expect(task.taskId, isA<TaskId>());
      expect(task.userId, isA<UserId>());
      expect(task.name, 'テストタスク');
      expect(task.description, 'テストタスクの説明');
      expect(task.earnCoins, const FamilyCoin(10));
      expect(task.difficulty, Difficulty.easy);
    });

    test('TaskをJSONに変換できる', () {
      final task = Task(
        taskId: TaskId(1),
        userId: UserId(2),
        name: 'テストタスク',
        description: 'テストタスクの説明',
        earnCoins: const FamilyCoin(10),
        difficulty: Difficulty.easy,
      );

      final json = task.toJson();
      expect(json['taskId'], 1);
      expect(json['userId'], 2);
      expect(json['name'], 'テストタスク');
      expect(json['description'], 'テストタスクの説明');
      expect(json['earnCoins'], 10);
      expect(json['difficulty'], Difficulty.easy.value);
    });

    test('JSONからTaskを生成できる', () {
      final json = {
        'taskId': 1,
        'userId': 2,
        'name': 'テストタスク',
        'description': 'テストタスクの説明',
        'earnCoins': 10,
        'difficulty': Difficulty.easy.value,
      };

      final task = Task.fromJson(json);
      expect(task.taskId.value, 1);
      expect(task.userId.value, 2);
      expect(task.name, 'テストタスク');
      expect(task.description, 'テストタスクの説明');
      expect(task.earnCoins, const FamilyCoin(10));
      expect(task.difficulty, Difficulty.easy);
    });

    test('Taskをコピーできる', () {
      final task = Task(
        taskId: TaskId.generate(),
        userId: UserId.generate(),
        name: 'テストタスク',
        description: 'テストタスクの説明',
        earnCoins: const FamilyCoin(10),
        difficulty: Difficulty.easy,
      );

      final copiedTask = task.copyWith(
        name: 'コピーされたタスク',
        earnCoins: const FamilyCoin(20),
      );

      expect(copiedTask.taskId, task.taskId);
      expect(copiedTask.userId, task.userId);
      expect(copiedTask.name, 'コピーされたタスク');
      expect(copiedTask.description, task.description);
      expect(copiedTask.earnCoins, const FamilyCoin(20));
      expect(copiedTask.difficulty, task.difficulty);
    });
  });
}

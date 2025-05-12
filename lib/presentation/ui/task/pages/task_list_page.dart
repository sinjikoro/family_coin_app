import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// タスク一覧
class TaskListPage extends ConsumerWidget {
  /// constructor
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サンプルタスクデータ
    const tasks = [
      {'id': '1', 'title': 'お風呂掃除', 'coins': 50},
      {'id': '2', 'title': 'ごみ出し', 'coins': 30},
      {'id': '3', 'title': '食器洗い', 'coins': 20},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('タスク一覧')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task['title']! as String),
            subtitle: Text("${task["coins"]}コイン"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => context.go("/tasks/${task["id"]}"),
          );
        },
      ),
    );
  }
}

import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク詳細
class TaskDetailPage extends ConsumerWidget {
  /// constructor
  const TaskDetailPage({required this.taskId, super.key});

  /// タスクID
  final Id taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 実際のアプリではここでIDを使ってデータを取得する
    // サンプルデータ
    final Map<String, Map<String, dynamic>> taskData = {
      '1': {'title': 'お風呂掃除', 'description': '浴槽、壁、床をきれいに洗う', 'coins': 50, 'deadline': '2023年12月10日'},
      '2': {'title': 'ごみ出し', 'description': '燃えるごみを指定の場所に出す', 'coins': 30, 'deadline': '2023年12月11日'},
      '3': {'title': '食器洗い', 'description': '夕食の食器を全て洗う', 'coins': 20, 'deadline': '2023年12月12日'},
    };

    /// タスク
    final task = taskData[taskId.toString()];

    return Scaffold(
      appBar: AppBar(title: Text(task?['title'] ?? 'タスク詳細')),
      body:
          task != null
              ? Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('タスク: ${task['title']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text('説明: ${task['description']}'),
                    const SizedBox(height: 10),
                    Text('報酬: ${task['coins']}コイン'),
                    const SizedBox(height: 10),
                    Text('期限: ${task['deadline']}'),
                  ],
                ),
              )
              : const Center(child: Text('タスクが見つかりません')),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Id>('taskId', taskId));
  }
}

import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク詳細
class TaskDetailPage extends ConsumerStatefulWidget {
  /// constructor
  const TaskDetailPage({required this.taskId, super.key});

  /// タスクID
  final Id taskId;

  @override
  ConsumerState<TaskDetailPage> createState() => _TaskDetailPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Id>('taskId', taskId));
  }
}

class _TaskDetailPageState extends ConsumerState<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    final taskAsync = ref.watch(
      taskListStateProvider.select(
        (tasks) =>
            tasks.value?.firstWhere((task) => task.id == widget.taskId, orElse: () => throw Exception('タスクが見つかりません')),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(taskAsync?.name ?? '')),
      body:
          taskAsync != null
              ? Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text('タスク: ${taskAsync.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('説明: ${taskAsync.description}'),
                    Text('報酬: ${taskAsync.earnCoins}コイン'),
                    Text('難易度: ${taskAsync.difficulty}'),
                    Text('登録状況: ${taskAsync.registrationStatus}'),
                  ],
                ),
              )
              : const Center(child: Text('タスクが見つかりません')),
    );
  }
}

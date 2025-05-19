import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/approval_status.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク作成ページ
class TaskCreatePage extends ConsumerWidget {
  /// Constructor
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.taskCreateTitle)),
    body: TaskFormWidget(
      task: Task(
        id: Id.generate(),
        name: '',
        userId: Id.generate(), // 仮のID
        earnCoins: const FamilyCoin(0),
        registrationStatus: ApprovalStatus.unapproved(),
        difficulty: Difficulty.easy,
      ),
      onSave: ({required name, required description, required earnCoins, required difficulty}) async {
        try {
          await ref
              .read(taskListStateProvider.notifier)
              .createTask(name: name, description: description, earnCoins: earnCoins, difficulty: difficulty);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        } on NotLoggedInException catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.error(e.toString()))));
          }
        }
      },
      onCancel: () => Navigator.of(context).pop(),
    ),
  );
}

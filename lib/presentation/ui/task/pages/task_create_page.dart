import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/usecase/create_task_usecase.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク作成ページ
class TaskCreatePage extends ConsumerWidget {
  /// Constructor
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId =
        ref.read(loggedInUserStateProvider).value?.id ?? UserId.generate();

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.taskCreateTitle)),
      body: TaskFormWidget(
        task: Task.initial(userId),
        onSave: ({
          required name,
          required description,
          required earnCoins,
          required difficulty,
        }) async {
          try {
            final usecase = CreateTaskUseCase(
              taskListState: ref.read(taskListStateProvider.notifier),
            );
            await usecase.execute(
              name: name,
              description: description,
              userId: userId,
              earnCoins: earnCoins,
              difficulty: difficulty,
            );
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          } on NotLoggedInException catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.error(e.toString()))),
              );
            }
          }
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }
}

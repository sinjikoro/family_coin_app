import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/usecase/task/create_task_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/presentation/ui/common/pages/error_page.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク作成ページ
class TaskCreatePage extends ConsumerWidget {
  /// Constructor
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeUser = ref.read(activeUserStateProvider).value;
    if (activeUser == null) {
      return ErrorPage(errorMessage: context.l10n.errorUnexpected);
    }
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.taskCreateTitle)),
      body: TaskFormWidget(
        task: Task.initial(activeUser.userId),
        onSave: ({
          required name,
          required description,
          required earnCoins,
          required difficulty,
        }) async {
          final usecase = CreateTaskUseCase(
            taskListState: ref.read(taskListStateProvider.notifier),
          );
          await usecase.execute(
            name: name,
            description: description,
            userId: activeUser.userId,
            earnCoins: earnCoins,
            difficulty: difficulty,
          );
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }
}

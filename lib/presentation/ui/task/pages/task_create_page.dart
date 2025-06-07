import 'package:family_coin/application/provider/logged_in_user_state.dart';
import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/application/usecase/task/create_task_usecase.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/ui/common/pages/error_page.dart';
import 'package:family_coin/presentation/ui/task/widgets/task_form_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク作成ページ
class TaskCreatePage extends ConsumerWidget {
  /// Constructor
  const TaskCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => FutureBuilder(
    future: ref.read(loggedInUserStateProvider.future),
    builder: (context, user) {
      switch (user.connectionState) {
        case ConnectionState.done:
          return user.hasData
              ? _TaskCreatePage(userId: user.data!.id)
              : ErrorPage(errorMessage: context.l10n.unexpectedError);
        case ConnectionState.waiting:
        case ConnectionState.none:
        case ConnectionState.active:
          return const Center(child: CircularProgressIndicator());
      }
    },
  );
}

/// タスク作成ページ
class _TaskCreatePage extends ConsumerWidget {
  const _TaskCreatePage({required this.userId});

  final UserId userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.taskCreateTitle)),
    body: TaskFormWidget(
      task: Task.initial(userId),
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
          userId: userId,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<UserId>('userId', userId));
  }
}

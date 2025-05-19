import 'package:family_coin/application/provider/task_list_state.dart';
import 'package:family_coin/core/exception/exception.dart';
import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タスク作成ページ
class TaskCreatePage extends ConsumerStatefulWidget {
  /// Constructor
  const TaskCreatePage({super.key});

  @override
  ConsumerState<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends ConsumerState<TaskCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _earnCoinsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _difficultyController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _earnCoinsController.dispose();
    _descriptionController.dispose();
    _difficultyController.dispose();
    super.dispose();
  }

  /// タスクを保存する
  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text;
    final earnCoins = FamilyCoin(int.parse(_earnCoinsController.text));
    final description = _descriptionController.text;
    final difficulty = Difficulty.byName(_difficultyController.text);

    try {
      await ref
          .read(taskListStateProvider.notifier)
          .createTask(name: name, description: description, earnCoins: earnCoins, difficulty: difficulty);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } on NotLoggedInException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.l10n.error(e.toString()))));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.taskCreateTitle)),
    body: Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: context.l10n.taskName),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.taskNameRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _earnCoinsController,
            decoration: InputDecoration(labelText: context.l10n.taskEarnCoin),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.taskEarnCoinRequired;
              }
              if (int.tryParse(value) == null) {
                return context.l10n.taskEarnCoinMustBeNumber;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: context.l10n.taskDescription),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<Difficulty>(
            items:
                [
                  Difficulty.easy,
                  Difficulty.normal,
                  Difficulty.hard,
                ].map((e) => DropdownMenuItem(value: e, child: Text(e.value))).toList(),
            onChanged: (value) {
              setState(() {
                _difficultyController.text = value?.value ?? '';
              });
            },
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: _saveTask, child: const Icon(Icons.save)),
  );
}

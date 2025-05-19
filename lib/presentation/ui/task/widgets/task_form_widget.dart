import 'package:family_coin/core/extension/context_extension.dart';
import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// タスクフォームウィジェット
class TaskFormWidget extends StatefulWidget {
  /// constructor
  const TaskFormWidget({required this.task, required this.onSave, required this.onCancel, super.key});

  /// タスク
  final Task task;

  /// 保存時のコールバック
  final Future<void> Function({
    required String name,
    required String description,
    required FamilyCoin earnCoins,
    required Difficulty difficulty,
  })
  onSave;

  /// キャンセル時のコールバック
  final VoidCallback onCancel;

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Task>('task', task))
      ..add(
        ObjectFlagProperty<
          Future<void> Function({
            required String description,
            required Difficulty difficulty,
            required FamilyCoin earnCoins,
            required String name,
          })
        >.has('onSave', onSave),
      )
      ..add(ObjectFlagProperty<VoidCallback>.has('onCancel', onCancel));
  }
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _earnCoinsController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _difficultyController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task.name);
    _earnCoinsController = TextEditingController(text: widget.task.earnCoins.value.toString());
    _descriptionController = TextEditingController(text: widget.task.description);
    _difficultyController = TextEditingController(text: widget.task.difficulty.value);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _earnCoinsController.dispose();
    _descriptionController.dispose();
    _difficultyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Form(
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
          value: widget.task.difficulty,
          items:
              [
                Difficulty.easy,
                Difficulty.normal,
                Difficulty.hard,
              ].map((e) => DropdownMenuItem(value: e, child: Text(e.value))).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _difficultyController.text = value.value;
              });
            }
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: widget.onCancel, child: const Icon(Icons.cancel)),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _saveTask, child: const Icon(Icons.save)),
          ],
        ),
      ],
    ),
  );

  /// タスクを保存する
  Future<void> _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    await widget.onSave(
      name: _nameController.text,
      description: _descriptionController.text,
      earnCoins: FamilyCoin(int.parse(_earnCoinsController.text)),
      difficulty: Difficulty.byName(_difficultyController.text),
    );
  }
}

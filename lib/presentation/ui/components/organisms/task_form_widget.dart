import 'package:family_coin/domain/model/task/task.dart';
import 'package:family_coin/domain/value_object/difficuly.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/presentation/ui/components/organisms/schedule_picker.dart';
import 'package:family_coin/presentation/util/extension/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rrule/rrule.dart';

/// タスクフォームウィジェット
class TaskFormWidget extends StatefulWidget {
  /// constructor
  const TaskFormWidget({required this.task, required this.onSave, super.key});

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
      );
  }
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _earnCoinsController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _difficultyController;
  DateTime? _selectedDate;
  RecurrenceRule? _selectedRule;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.task.name);
    _earnCoinsController = TextEditingController(
      text: widget.task.earnCoins.value.toString(),
    );
    _descriptionController = TextEditingController(
      text: widget.task.description,
    );
    _difficultyController = TextEditingController(
      text: widget.task.difficulty.value,
    );
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
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                _TaskNameField(nameController: _nameController),
                _EarnCoinField(earnCoinsController: _earnCoinsController),
                _DescriptionField(
                  descriptionController: _descriptionController,
                ),
                // 難易度
                _DifficultyField(
                  initialValue: widget.task.difficulty,
                  onChanged: (value) {
                    setState(() {
                      _difficultyController.text = value.value;
                    });
                  },
                ),
                // スケジュール
                _ScheduleField(
                  selectedDate: _selectedDate,
                  selectedRule: _selectedRule,
                  onDateSelected: (date, rule) {
                    setState(() {
                      _selectedDate = date;
                      _selectedRule = rule;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _saveTask,
              child: const Icon(Icons.save),
            ),
          ),
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

/// タスク名フィールド
class _TaskNameField extends StatelessWidget {
  const _TaskNameField({required TextEditingController nameController})
    : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: _nameController,
    decoration: InputDecoration(labelText: context.l10n.taskName),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return context.l10n.taskNameRequired;
      }
      return null;
    },
  );
}

/// 獲得コインフィールド
class _EarnCoinField extends StatelessWidget {
  const _EarnCoinField({required TextEditingController earnCoinsController})
    : _earnCoinsController = earnCoinsController;

  final TextEditingController _earnCoinsController;

  @override
  Widget build(BuildContext context) => TextFormField(
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
  );
}

/// 説明フィールド
class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    required TextEditingController descriptionController,
  }) : _descriptionController = descriptionController;

  final TextEditingController _descriptionController;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: _descriptionController,
    decoration: InputDecoration(labelText: context.l10n.taskDescription),
    maxLines: 3,
  );
}

/// 難易度フィールド
class _DifficultyField extends StatelessWidget {
  const _DifficultyField({
    required Difficulty initialValue,
    required void Function(Difficulty) onChanged,
  }) : _initialValue = initialValue,
       _onChanged = onChanged;

  final Difficulty _initialValue;
  final void Function(Difficulty) _onChanged;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<Difficulty>(
    value: _initialValue,
    items:
        [
          Difficulty.easy,
          Difficulty.normal,
          Difficulty.hard,
        ].map((e) => DropdownMenuItem(value: e, child: Text(e.value))).toList(),
    onChanged: (value) {
      if (value != null) {
        _onChanged(value);
      }
    },
  );
}

/// スケジュールフィールド
class _ScheduleField extends StatelessWidget {
  const _ScheduleField({
    required DateTime? selectedDate,
    required RecurrenceRule? selectedRule,
    required void Function(DateTime?, RecurrenceRule?) onDateSelected,
  }) : _selectedDate = selectedDate,
       _selectedRule = selectedRule,
       _onDateSelected = onDateSelected;

  final DateTime? _selectedDate;
  final RecurrenceRule? _selectedRule;
  final void Function(DateTime?, RecurrenceRule?) _onDateSelected;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () async {
      await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: context.screenHeight * 0.7),
        builder:
            (context) => SchedulePicker(
              onDateSelected: _onDateSelected,
              initialDate: _selectedDate,
              initialRule: _selectedRule,
            ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(),
      ),
      height: 50,
      alignment: Alignment.center,
      child: Text(
        _selectedDate != null
            ? DateFormat(
              context.l10n.dateFormat,
              context.l10n.localeName,
            ).format(_selectedDate!)
            : context.l10n.taskNotScheduled,
      ),
    ),
  );
}

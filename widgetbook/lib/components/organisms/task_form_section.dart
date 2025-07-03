import 'package:family_coin/presentation/ui/components/organisms/task_form_section.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Challenge Task', type: TaskFormSection)
Widget challengeTaskFormSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: TaskFormSection(
        taskType: 0,
        taskName: '',
        description: '',
        onTaskNameChanged: (v) {},
        onDescriptionChanged: (v) {},
      ),
    ),
  );

@widgetbook.UseCase(name: 'Routine Task', type: TaskFormSection)
Widget routineTaskFormSectionUseCase(BuildContext context) => 
  Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: TaskFormSection(
        taskType: 1,
        taskName: '',
        description: '',
        onTaskNameChanged: (v) {},
        onDescriptionChanged: (v) {},
      ),
    ),
  );
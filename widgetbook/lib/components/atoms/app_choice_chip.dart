import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_choice_chip.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Single Choice', type: AppChoiceChip)
Widget singleChoiceUseCase(BuildContext context) {
  return _SingleChoiceDemo();
}

@widgetbook.UseCase(name: 'Multi Choice', type: AppChoiceChip)
Widget multiChoiceUseCase(BuildContext context) {
  return _MultiChoiceDemo();
}

class _SingleChoiceDemo extends StatefulWidget {
  @override
  State<_SingleChoiceDemo> createState() => _SingleChoiceDemoState();
}

class _SingleChoiceDemoState extends State<_SingleChoiceDemo> {
  int selected = 0;
  final labels = ['毎日', '毎週', 'カスタム'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        labels.length,
        (i) => AppChoiceChip(
          label: labels[i],
          selected: selected == i,
          onSelected: (_) => setState(() => selected = i),
        ),
      ),
    );
  }
}

class _MultiChoiceDemo extends StatefulWidget {
  @override
  State<_MultiChoiceDemo> createState() => _MultiChoiceDemoState();
}

class _MultiChoiceDemoState extends State<_MultiChoiceDemo> {
  final labels = ['月', '火', '水', '木', '金', '土', '日'];
  final selected = List<bool>.filled(7, true)
    ..[5] = false
    ..[6] = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        labels.length,
        (i) => AppChoiceChip(
          label: labels[i],
          selected: selected[i],
          onSelected: (v) => setState(() => selected[i] = v),
        ),
      ),
    );
  }
}

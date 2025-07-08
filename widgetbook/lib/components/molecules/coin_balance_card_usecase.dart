import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/coin_balance_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: CoinBalanceCard,
  path: WidgetbookRoutePath.molecules,
)
Widget coinBalanceCardUseCase(BuildContext context) {
  final balance = context.knobs.int.slider(
    label: 'Balance',
    description: 'コイン残高',
    min: 0,
    max: 10000,
    divisions: 100,
    initialValue: 1250,
  );

  final showDiff = context.knobs.boolean(
    label: 'Show Diff',
    description: '差分を表示する',
    initialValue: true,
  );

  final diff = showDiff
      ? context.knobs.int.slider(
          label: 'Diff',
          description: '差分（正の値で増加、負の値で減少）',
          min: -1000,
          max: 1000,
          divisions: 100,
          initialValue: 50,
        )
      : null;

  return Padding(
    padding: const EdgeInsets.all(16),
    child: CoinBalanceCard(balance: balance, diff: diff),
  );
}

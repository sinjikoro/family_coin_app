import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/molecules/coin_balance_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CoinBalanceCard)
Widget coinBalanceCardDefaultUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: CoinBalanceCard(balance: 1250, diff: 50),
  );
}

@widgetbook.UseCase(name: 'NoDiff', type: CoinBalanceCard)
Widget coinBalanceCardNoDiffUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: CoinBalanceCard(balance: 800),
  );
}

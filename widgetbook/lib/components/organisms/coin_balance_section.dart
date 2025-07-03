import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/coin_balance_section.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CoinBalanceSection)
Widget coinBalanceSectionUseCase(BuildContext context) {
  return const CoinBalanceSection(balance: 150);
}

@widgetbook.UseCase(name: 'With Positive Diff', type: CoinBalanceSection)
Widget coinBalanceSectionWithPositiveDiffUseCase(BuildContext context) {
  return const CoinBalanceSection(balance: 150, diff: 25);
}

@widgetbook.UseCase(name: 'With Negative Diff', type: CoinBalanceSection)
Widget coinBalanceSectionWithNegativeDiffUseCase(BuildContext context) {
  return const CoinBalanceSection(balance: 150, diff: -10);
}

@widgetbook.UseCase(name: 'Zero Balance', type: CoinBalanceSection)
Widget coinBalanceSectionZeroUseCase(BuildContext context) {
  return const CoinBalanceSection(balance: 0);
}

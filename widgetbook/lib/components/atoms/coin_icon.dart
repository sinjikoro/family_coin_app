import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/coin_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CoinIcon)
Widget coinIconDefaultUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: CoinIcon());
}

@widgetbook.UseCase(name: 'Large', type: CoinIcon)
Widget coinIconLargeUseCase(BuildContext context) {
  return const Padding(padding: EdgeInsets.all(16), child: CoinIcon(size: 60));
}

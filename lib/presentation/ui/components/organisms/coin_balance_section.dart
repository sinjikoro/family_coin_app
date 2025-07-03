import 'package:family_coin/presentation/ui/components/molecules/coin_balance_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// コイン残高セクション
class CoinBalanceSection extends StatelessWidget {
  /// コンストラクタ
  const CoinBalanceSection({required this.balance, super.key, this.diff});

  /// コイン残高
  final int balance;

  /// 増減値
  final int? diff;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: CoinBalanceCard(balance: balance, diff: diff),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('balance', balance))
      ..add(IntProperty('diff', diff));
  }
}

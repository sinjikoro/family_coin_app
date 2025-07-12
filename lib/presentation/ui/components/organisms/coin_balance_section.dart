import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/molecules/value_display_card.dart';
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
    child: ValueDisplayCard(
      icon: const AppIcon(type: AppIconType.coin, size: 48),
      value: balance.toString(),
      changeValue: diff != null && diff! > 0 ? '+$diff' : null,
      changeIcon: diff != null && diff! > 0 ? const AppIcon(type: AppIconType.arrowUp, size: 18) : null,
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('balance', balance))
      ..add(IntProperty('diff', diff));
  }
}

import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// コイン残高カード
class CoinBalanceCard extends StatelessWidget {
  /// コンストラクタ
  const CoinBalanceCard({required this.balance, super.key, this.diff});

  /// コイン残高
  final int balance;

  /// 増減値
  final int? diff;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onInverseSurface,
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
    child: Row(
      children: [
        const AppIcon(type: AppIconType.coin, size: 48),
        const SizedBox(width: 20),
        Expanded(
          child: AppText(
            text: balance.toString(),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (diff != null && diff! > 0) ...[
          const AppIcon(type: AppIconType.arrowUp, size: 18),
          const SizedBox(width: 4),
          AppText(
            text: '+$diff',
            fontSize: 18,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ],
      ],
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

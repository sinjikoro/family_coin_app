import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ごほうび（ほしいもの）カード
class WishitemCard extends StatelessWidget {
  /// constructor
  const WishitemCard({
    required this.wishitem,
    super.key,
    this.onTap,
    this.backgroundColor,
    this.icon,
  });

  /// ごほうび（ほしいもの）
  final Wishitem wishitem;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  /// 背景色
  final Color? backgroundColor;

  /// アイコン
  final IconData? icon;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.card_giftcard,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            wishitem.name,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            wishitem.description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            '${wishitem.price.value} コイン',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap))
      ..add(DiagnosticsProperty<Wishitem>('wishitem', wishitem))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty<IconData?>('icon', icon));
  }
}

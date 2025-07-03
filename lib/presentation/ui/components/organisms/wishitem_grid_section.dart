import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/presentation/ui/components/molecules/wishitem_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// ほしいものグリッドセクション
class WishitemGridSection extends StatelessWidget {
  /// constructor
  const WishitemGridSection({required this.wishitems, super.key, this.onTap});

  /// ほしいものリスト
  final List<Wishitem> wishitems;

  /// タップ時のコールバック
  final void Function(Wishitem)? onTap;

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.icecream,
      Icons.sports_esports,
      Icons.book,
      Icons.favorite,
      Icons.palette,
      Icons.dinner_dining,
      Icons.directions_run,
      Icons.flight,
    ];
    final colors = [
      Colors.yellow[100],
      Colors.blue[50],
      Colors.pink[50],
      Colors.green[50],
      Colors.purple[50],
      Colors.orange[100],
    ];
    return GridView.builder(
      itemCount: wishitems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        final wishitem = wishitems[index];
        return WishitemCard(
          wishitem: wishitem,
          icon: icons[index % icons.length],
          backgroundColor: colors[index % colors.length],
          onTap: () => onTap?.call(wishitem),
        );
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<Wishitem>('wishitems', wishitems))
      ..add(
        ObjectFlagProperty<void Function(Wishitem p1)?>.has('onTap', onTap),
      );
  }
}

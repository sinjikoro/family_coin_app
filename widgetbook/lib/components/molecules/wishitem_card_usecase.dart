import 'package:flutter/material.dart';
import 'package:family_coin/domain/model/wishitem/wishitem.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:family_coin/domain/value_object/id.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:family_coin/presentation/ui/components/molecules/wishitem_card.dart';
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: WishitemCard,
  path: WidgetbookRoutePath.molecules,
)
Widget wishitemCardUseCase(BuildContext context) {
  final name = context.knobs.string(
    label: 'Name',
    description: 'ほしいものの名前',
    initialValue: 'アイスクリーム',
  );

  final description = context.knobs.string(
    label: 'Description',
    description: 'ほしいものの説明',
    initialValue: '好きなアイスを1個',
  );

  final coin = context.knobs.int.slider(
    label: 'Coin',
    description: '必要なコイン数',
    initialValue: 50,
    min: 0,
    max: 1000,
    divisions: 100,
  );

  final icon = context.knobs.list<IconData>(
    label: 'Icon',
    description: 'アイコンの種類',
    options: [
      Icons.icecream,
      Icons.book,
      Icons.games,
      Icons.movie,
      Icons.restaurant,
    ],
    initialOption: Icons.icecream,
  );

  final backgroundColor = context.knobs.color(
    label: 'Background Color',
    description: '背景色',
    initialValue: Colors.yellow[100]!,
  );

  final hasCallback = context.knobs.boolean(
    label: 'Has Callback',
    description: 'タップ時のコールバックを有効にする',
    initialValue: true,
  );

  final wishitem = Wishitem(
    wishItemId: WishitemId.generate(),
    name: name,
    userId: UserId.generate(),
    price: FamilyCoin(coin),
    description: description,
  );

  return Padding(
    padding: const EdgeInsets.all(16),
    child: WishitemCard(
      wishitem: wishitem,
      icon: icon,
      backgroundColor: backgroundColor,
      onTap: hasCallback ? () {} : null,
    ),
  );
}

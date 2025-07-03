import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/organisms/wishitem_read_only_widget.dart';
import 'package:family_coin/domain/value_object/family_coin.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: WishitemReadOnlyWidget)
Widget wishitemReadOnlyWidgetUseCase(BuildContext context) {
  return const WishitemReadOnlyWidget(
    wishitemName: 'おもちゃの車',
    wishitemDescription: 'リモコンで操作できるおもちゃの車です。',
    wishitemPrice: FamilyCoin(100),
  );
}

@widgetbook.UseCase(name: 'With URL', type: WishitemReadOnlyWidget)
Widget wishitemReadOnlyWidgetWithUrlUseCase(BuildContext context) {
  return WishitemReadOnlyWidget(
    wishitemName: 'おもちゃの車',
    wishitemDescription: 'リモコンで操作できるおもちゃの車です。',
    wishitemPrice: const FamilyCoin(100),
    wishitemUrl: Uri.parse('https://example.com/toy-car'),
  );
}

@widgetbook.UseCase(name: 'Expensive Item', type: WishitemReadOnlyWidget)
Widget wishitemReadOnlyWidgetExpensiveUseCase(BuildContext context) {
  return WishitemReadOnlyWidget(
    wishitemName: 'ゲーム機',
    wishitemDescription: '最新のゲーム機です。',
    wishitemPrice: const FamilyCoin(500),
    wishitemUrl: Uri.parse('https://example.com/game-console'),
  );
}

@widgetbook.UseCase(name: 'Cheap Item', type: WishitemReadOnlyWidget)
Widget wishitemReadOnlyWidgetCheapUseCase(BuildContext context) {
  return const WishitemReadOnlyWidget(
    wishitemName: 'お菓子',
    wishitemDescription: '美味しいお菓子です。',
    wishitemPrice: FamilyCoin(10),
  );
}

@widgetbook.UseCase(name: 'Long Description', type: WishitemReadOnlyWidget)
Widget wishitemReadOnlyWidgetLongDescriptionUseCase(BuildContext context) {
  return const WishitemReadOnlyWidget(
    wishitemName: '本',
    wishitemDescription:
        'とても長い説明文です。この本は非常に興味深い内容で、読む人を魅了します。多くのページがあり、読むのに時間がかかりますが、それだけの価値があります。',
    wishitemPrice: FamilyCoin(50),
  );
}

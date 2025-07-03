import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/app_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'All Icons',
  type: AppIcon,
  path: WidgetbookRoutePath.atoms,
)
Widget appIconAllUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AppIcon.calendar(size: 24),
        AppIcon.calendarCheck(size: 24),
        AppIcon.book(size: 24),
        AppIcon.bookOpen(size: 24),
        AppIcon.activity(size: 24),
        AppIcon.coin(size: 24),
        AppIcon.gamepad(size: 24),
        AppIcon.gift(size: 24),
        AppIcon.heart(size: 24),
        AppIcon.iceCream(size: 24),
        AppIcon.pizza(size: 24),
        AppIcon.repeat(size: 24),
        AppIcon.settings(size: 24),
        AppIcon.star(size: 24),
        AppIcon.tradingUp(size: 24),
        AppIcon.trophy(size: 24),
        AppIcon.tradingDown(size: 24),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Colored Icons',
  type: AppIcon,
  path: WidgetbookRoutePath.atoms,
)
Widget appIconColoredUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AppIcon.calendar(size: 24, color: Colors.blue),
        AppIcon.calendarCheck(size: 24, color: Colors.green),
        AppIcon.book(size: 24, color: Colors.orange),
        AppIcon.bookOpen(size: 24, color: Colors.purple),
        AppIcon.activity(size: 24, color: Colors.red),
        AppIcon.coin(size: 24, color: Colors.amber),
        AppIcon.gamepad(size: 24, color: Colors.indigo),
        AppIcon.gift(size: 24, color: Colors.pink),
        AppIcon.heart(size: 24, color: Colors.red),
        AppIcon.iceCream(size: 24, color: Colors.cyan),
        AppIcon.pizza(size: 24, color: Colors.deepOrange),
        AppIcon.repeat(size: 24, color: Colors.teal),
        AppIcon.settings(size: 24, color: Colors.grey),
        AppIcon.star(size: 24, color: Colors.yellow),
        AppIcon.tradingUp(size: 24, color: Colors.green),
        AppIcon.trophy(size: 24, color: Colors.amber),
        AppIcon.tradingDown(size: 24, color: Colors.red),
      ],
    ),
  );
}

@widgetbook.UseCase(
  name: 'Different Sizes',
  type: AppIcon,
  path: WidgetbookRoutePath.atoms,
)
Widget appIconSizesUseCase(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AppIcon.calendar(size: 16),
        AppIcon.calendar(size: 24),
        AppIcon.calendar(size: 32),
        AppIcon.calendar(size: 48),
        AppIcon.coin(size: 16),
        AppIcon.coin(size: 24),
        AppIcon.coin(size: 32),
        AppIcon.coin(size: 48),
        AppIcon.heart(size: 16),
        AppIcon.heart(size: 24),
        AppIcon.heart(size: 32),
        AppIcon.heart(size: 48),
      ],
    ),
  );
}

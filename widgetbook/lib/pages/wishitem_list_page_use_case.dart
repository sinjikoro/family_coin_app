import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/pages/wishitem_list_page.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: WishitemListPage,
  path: WidgetbookRoutePath.pages,
)
Widget wishitemListPageDefaultUseCase(BuildContext context) {
  return const WishitemListPage();
}

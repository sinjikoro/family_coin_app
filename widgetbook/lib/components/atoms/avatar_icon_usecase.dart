import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/avatar_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';

@widgetbook.UseCase(
  name: 'AvatarIcon',
  type: AvatarIcon,
  path: WidgetbookRoutePath.atoms,
)
Widget avatarIconUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AvatarIcon.svgPath(svgPath: AvatarNone().imagePath),
        AvatarIcon.svgPath(svgPath: AvatarBoy().imagePath),
        AvatarIcon.svgPath(svgPath: AvatarCat().imagePath),
        AvatarIcon.svgPath(svgPath: AvatarDog().imagePath),
      ],
    ),
  );
}

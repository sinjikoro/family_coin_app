import 'package:family_coin/domain/value_object/avatar.dart';
import 'package:flutter/material.dart';
import 'package:family_coin/presentation/ui/components/atoms/avatar_icon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/routing/route_path.dart';
import 'package:widgetbook/widgetbook.dart';

@widgetbook.UseCase(
  name: 'Interactive',
  type: AvatarIcon,
  path: WidgetbookRoutePath.atoms,
)
Widget avatarIconInteractiveUseCase(BuildContext context) {
  final avatarOptions = [
    AvatarNone().value,
    AvatarBoy().value,
    AvatarCat().value,
    AvatarDog().value,
  ];

  final selectedAvatar = context.knobs.list(
    label: 'Avatar',
    description: 'アバターの種類',
    options: avatarOptions,
    initialOption: AvatarNone().value,
  );

  final size = context.knobs.double.slider(
    label: 'Size',
    description: 'アバターのサイズ',
    min: 16.0,
    max: 96.0,
    divisions: 20,
    initialValue: 24.0,
  );

  return Center(
    child: AvatarIcon.svgPath(
      svgPath: Avatar.byName(selectedAvatar).imagePath,
      size: size,
    ),
  );
}

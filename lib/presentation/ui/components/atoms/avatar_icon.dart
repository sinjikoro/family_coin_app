import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// アバターアイコンコンポーネント
/// AvatarIconTypeに基づいて画像を表示
class AvatarIcon extends StatelessWidget {
  /// コンストラクタ
  AvatarIcon.svgPath({required String svgPath, super.key})
    : icon = SvgPicture.asset(
        svgPath,
        width: _radius * 2,
        height: _radius * 2,
        fit: BoxFit.cover,
      );

  /// アバターの種類
  final Widget icon;

  /// アバターの半径
  static const _radius = 24.0;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: _radius,
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    child: ClipOval(child: icon),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Widget>('icon', icon));
  }
}

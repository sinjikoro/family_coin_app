import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// アバターアイコンコンポーネント
/// AvatarIconTypeに基づいて画像を表示
class AvatarIcon extends StatelessWidget {
  /// コンストラクタ
  AvatarIcon.svgPath({required String svgPath, this.size = 24, super.key})
    : icon = SvgPicture.asset(
        svgPath,
        width: size * 2,
        height: size * 2,
        fit: BoxFit.cover,
      );

  /// アバターの種類
  final Widget icon;

  /// アイコンのサイズ
  final double size;

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: size,
    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    child: ClipOval(child: icon),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Widget>('icon', icon))
      ..add(DoubleProperty('size', size));
  }
}

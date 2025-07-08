import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// アイコン種別
enum AppIconType {
  /// カレンダー
  calendar,

  /// カレンダー(チェック)
  calendarCheck,

  /// 本
  book,

  /// 本(開く)
  bookOpen,

  /// アクティビティ
  activity,

  /// コイン
  coin,

  /// ゲーム
  gamepad,

  /// 贈り物
  gift,

  /// ハート
  heart,

  /// アイスクリーム
  iceCream,

  /// ピザ
  pizza,

  /// リピート
  repeat,

  /// 設定
  settings,

  /// 星
  star,

  /// トレンド（UP）
  trendingUp,

  /// トロフィー
  trophy,

  /// 未完了用サークルアイコン
  circle,

  /// 完了用チェックアイコン
  checkCircle,

  /// 上向き矢印アイコン（増加値用）
  arrowUp,
}

/// 用途ごとにアイコン種別を切り替えられるAppIcon
class AppIcon extends StatelessWidget {
  /// コンストラクタ
  const AppIcon({
    required this.type,
    required this.size,
    this.color = Colors.black,
    super.key,
  });

  /// アイコン種別
  final AppIconType type;

  /// サイズ
  final double size;

  /// 色
  final Color color;

  /// アイコンパスを取得
  String get _imagePath {
    switch (type) {
      case AppIconType.calendar:
        return 'assets/images/icon/calendar.svg';
      case AppIconType.calendarCheck:
        return 'assets/images/icon/calendar_check.svg';
      case AppIconType.book:
        return 'assets/images/icon/book.svg';
      case AppIconType.bookOpen:
        return 'assets/images/icon/book_open.svg';
      case AppIconType.activity:
        return 'assets/images/icon/activity.svg';
      case AppIconType.coin:
        return 'assets/images/icon/coins.svg';
      case AppIconType.gamepad:
        return 'assets/images/icon/gamepad.svg';
      case AppIconType.gift:
        return 'assets/images/icon/gift.svg';
      case AppIconType.heart:
        return 'assets/images/icon/heart.svg';
      case AppIconType.iceCream:
        return 'assets/images/icon/icecream.svg';
      case AppIconType.pizza:
        return 'assets/images/icon/pizza.svg';
      case AppIconType.repeat:
        return 'assets/images/icon/repeat.svg';
      case AppIconType.settings:
        return 'assets/images/icon/settings.svg';
      case AppIconType.star:
        return 'assets/images/icon/star.svg';
      case AppIconType.trendingUp:
        return 'assets/images/icon/trending_up.svg';
      case AppIconType.trophy:
        return 'assets/images/icon/trophy.svg';
      case AppIconType.circle:
      case AppIconType.checkCircle:
      case AppIconType.arrowUp:
        return '';
    }
  }

  /// Material Iconsを取得
  IconData? get _iconData => switch (type) {
    AppIconType.circle => Icons.radio_button_unchecked,
    AppIconType.checkCircle => Icons.check_circle,
    AppIconType.arrowUp => Icons.arrow_upward,
    _ => null,
  };

  @override
  Widget build(BuildContext context) {
    if (_iconData != null) {
      return Icon(_iconData, size: size, color: color);
    }
    return SvgPicture.asset(
      _imagePath,
      height: size,
      width: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<AppIconType>('type', type))
      ..add(DoubleProperty('size', size))
      ..add(ColorProperty('color', color));
  }
}

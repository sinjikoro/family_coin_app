import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 用途ごとにアイコン種別を切り替えられるAppIcon
class AppIcon extends StatelessWidget {
  /// コンストラクタ
  const AppIcon({required this.size, this.color = Colors.black, super.key})
    : _imagePath = '',
      _iconData = null;

  /// カレンダー
  const AppIcon.calendar({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/calendar.svg',
       _iconData = null;

  /// カレンダー(チェック)
  const AppIcon.calendarCheck({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/calendar_check.svg',
       _iconData = null;

  /// 本
  const AppIcon.book({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'assets/images/icon/book.svg',
      _iconData = null;

  /// 本(開く)
  const AppIcon.bookOpen({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/book_open.svg',
       _iconData = null;

  /// アクティビティ
  const AppIcon.activity({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/activity.svg',
       _iconData = null;

  /// コイン
  const AppIcon.coin({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'assets/images/icon/coins.svg',
      _iconData = null;

  /// ゲーム
  const AppIcon.gamepad({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/gamepad.svg',
       _iconData = null;

  /// 贈り物
  const AppIcon.gift({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'assets/images/icon/gift.svg',
      _iconData = null;

  /// ハート
  const AppIcon.heart({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/heart.svg',
       _iconData = null;

  /// アイスクリーム
  const AppIcon.iceCream({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/icecream.svg',
       _iconData = null;

  /// ピザ
  const AppIcon.pizza({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/pizza.svg',
       _iconData = null;

  /// リピート
  const AppIcon.repeat({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/repeat.svg',
       _iconData = null;

  /// 設定
  const AppIcon.settings({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/settings.svg',
       _iconData = null;

  /// 星
  const AppIcon.star({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'assets/images/icon/star.svg',
      _iconData = null;

  /// トレード（UP）
  const AppIcon.trendingUp({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/trending_up.svg',
       _iconData = null;

  /// トロフィー
  const AppIcon.trophy({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'assets/images/icon/trophy.svg',
       _iconData = null;

  /// 未完了用サークルアイコン
  const AppIcon.circle({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = '',
       _iconData = Icons.radio_button_unchecked;

  /// 完了用チェックアイコン
  const AppIcon.checkCircle({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = '',
       _iconData = Icons.check_circle;

  /// 上向き矢印アイコン（増加値用）
  const AppIcon.arrowUp({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = '',
       _iconData = Icons.arrow_upward;

  /// アイコン
  final String _imagePath;

  /// Material Icons
  final IconData? _iconData;

  /// サイズ
  final double size;

  /// 色
  final Color color;

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
      ..add(DoubleProperty('size', size))
      ..add(ColorProperty('color', color));
  }
}

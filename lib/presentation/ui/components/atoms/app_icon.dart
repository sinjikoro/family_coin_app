import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 用途ごとにアイコン種別を切り替えられるAppIcon
class AppIcon extends StatelessWidget {
  /// コンストラクタ
  const AppIcon({required this.size, this.color = Colors.black, super.key})
    : _imagePath = '';

  /// カレンダー
  const AppIcon.calendar({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/calendar.svg';

  /// カレンダー(チェック)
  const AppIcon.calendarCheck({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/calendar_check.svg';

  /// 本
  const AppIcon.book({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'images/icon/book.svg';

  /// 本(開く)
  const AppIcon.bookOpen({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/book_open.svg';

  /// アクティビティ
  const AppIcon.activity({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/activity.svg';

  /// コイン
  const AppIcon.coin({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'images/icon/coin.svg';

  /// ゲーム
  const AppIcon.gamepad({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/gamepad.svg';

  /// 贈り物
  const AppIcon.gift({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'images/icon/gift.svg';

  /// ハート
  const AppIcon.heart({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/heart.svg';

  /// アイスクリーム
  const AppIcon.iceCream({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/ice_cream.svg';

  /// ピザ
  const AppIcon.pizza({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/pizza.svg';

  /// リピート
  const AppIcon.repeat({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/repeat.svg';

  /// 設定
  const AppIcon.settings({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/settings.svg';

  /// 星
  const AppIcon.star({required this.size, this.color = Colors.black, super.key})
    : _imagePath = 'images/icon/star.svg';

  /// トレード（UP）
  const AppIcon.tradingUp({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/trading_up.svg';

  /// トロフィー
  const AppIcon.trophy({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/trophy.svg';

  /// トレード（DOWN）
  const AppIcon.tradingDown({
    required this.size,
    this.color = Colors.black,
    super.key,
  }) : _imagePath = 'images/icon/trading_down.svg';

  /// アイコン
  final String _imagePath;

  /// サイズ
  final double size;

  /// 色
  final Color color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    _imagePath,
    height: size,
    width: size,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('size', size))
      ..add(ColorProperty('color', color));
  }
}

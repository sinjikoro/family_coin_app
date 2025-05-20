import 'package:family_coin/domain/value_object/id.dart';

// TODO(nage): パス要素を整理する
/// ルートパス
class RoutePath {
  /// ホーム
  static const String home = '/';

  /// タスク一覧
  static const String taskList = '/tasks';

  /// タスク詳細
  static String taskDetail(Id id) => '/tasks/${id.value}';

  /// タスク作成
  static const String taskCreate = '/tasks/new';

  /// 欲しいもの一覧
  static const String wishItemList = '/wish-items';

  /// 欲しいもの詳細
  static String wishItemDetail(Id id) => '/wish-items/${id.value}';

  /// 欲しいもの作成
  static const String wishItemCreate = '/wish-items/new';
}

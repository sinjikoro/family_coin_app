/// ログインしていない場合の例外
final class NotLoggedInException implements Exception {
  // TODO(naga): 多言語対応
  @override
  String toString() => 'ログインしていません';
}

/// タスクが見つからない場合の例外
final class TaskNotFoundException implements Exception {
  // TODO(naga): 多言語対応
  @override
  String toString() => 'タスクが見つかりません';
}

final class UserNotFoundException implements Exception {
  // TODO(naga): 多言語対応
  @override
  String toString() => 'ユーザーが見つかりません';
}

final class WishItemNotFoundException implements Exception {
  // TODO(naga): 多言語対応
  @override
  String toString() => 'ほしいものが見つかりません';
}

final class FamilyCoinNotEnoughException implements Exception {
  // TODO(naga): 多言語対応
  @override
  String toString() => 'FamilyCoinが不足しています';
}

final class LoggedInUserCannotDeleteException implements Exception {
  // TODO(naga): 多言語対応
  @override
  String toString() => 'ログイン中のユーザーは削除できません';
}

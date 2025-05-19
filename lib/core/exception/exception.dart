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

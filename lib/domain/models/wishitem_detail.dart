/// ほしいもの詳細
class WishitemDetail {
  /// Constructor
  const WishitemDetail({this.description = '', this.url});

  /// 説明
  final String description;

  /// 参考URL
  /// ECサイトのURLなど
  final Uri? url;
}

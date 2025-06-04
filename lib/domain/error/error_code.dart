/// エラーコード
enum ErrorCode {
  /// ファミリーコインが0未満
  familyCoinNegative('FAMILY_COIN_NEGATIVE'),

  /// ファミリーコインの符号反転
  familyCoinSignInversion('FAMILY_COIN_SIGN_INVERSION'),

  /// 負の数での乗算
  familyCoinNegativeMultiplication('FAMILY_COIN_NEGATIVE_MULTIPLICATION'),

  /// 0または負の数での除算
  familyCoinInvalidDivision('FAMILY_COIN_INVALID_DIVISION'),

  /// 0または負の数での剰余
  familyCoinInvalidModulo('FAMILY_COIN_INVALID_MODULO');

  /// エラーコード
  final String code;

  /// コンストラクタ
  const ErrorCode(this.code);
}

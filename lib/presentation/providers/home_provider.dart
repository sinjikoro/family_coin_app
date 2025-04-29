import 'package:family_coin/application/usecase/get_user_info_usecase.dart';
import 'package:family_coin/domain/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// ユーザー情報を取得するProvider
@riverpod
Future<User?> user(Ref ref) async {
  const getUserInfoUseCase = GetUserInfoUseCase();
  return await getUserInfoUseCase.call();
}

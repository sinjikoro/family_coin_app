import 'package:family_coin/application/usecase/get_user_info_usecase.dart';
import 'package:family_coin/domain/model/user.dart';
import 'package:family_coin/presentation/providers/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユーザー情報を取得するProvider
final userProvider = FutureProvider<User?>((ref) {
  final getUserInfoUseCase = GetUserInfoUseCase(
    ref.watch(userRepositoryProvider),
  );
  return getUserInfoUseCase();
});

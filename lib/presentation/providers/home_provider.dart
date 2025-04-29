import 'package:family_coin/application/usecase/get_user_info_usecase.dart';
import 'package:family_coin/domain/model/user.dart';
import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// GetUserInfoUseCaseのProvider
@riverpod
GetUserInfoUseCase getUserInfoUseCase(Ref ref) =>
    GetUserInfoUseCase(GetIt.instance<UserRepository>());

/// ユーザー情報を取得するProvider
@riverpod
Future<User?> user(Ref ref) {
  final getUserInfoUseCase = ref.watch(getUserInfoUseCaseProvider);
  return getUserInfoUseCase();
}

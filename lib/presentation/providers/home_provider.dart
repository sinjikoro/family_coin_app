import 'package:family_coin/application/usecase/get_user_info_usecase.dart';
import 'package:family_coin/application/usecase/update_user_name_usecase.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// ホーム画面の状態を管理するProvider
@riverpod
class HomePage extends _$HomePage {
  @override
  Future<HomeState> build() async {
    final getUserInfoUseCase = GetUserInfoUseCase();
    final user = await getUserInfoUseCase.call();
    return HomeState(user: user);
  }

  /// ユーザー名を更新する
  Future<void> updateUserName(String name) async {
    final updateUserNameUseCase = UpdateUserNameUseCase();
    await updateUserNameUseCase.execute(name);
    ref.invalidateSelf();
  }
}

/// ホーム画面の状態
class HomeState {
  /// Constructor
  const HomeState({required this.user});

  /// ユーザー情報
  final User? user;
}

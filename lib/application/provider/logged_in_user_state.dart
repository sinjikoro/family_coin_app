import 'package:family_coin/domain/model/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logged_in_user_state.g.dart';

/// ユーザーのNotifier
@riverpod
class LoggedInUserState extends _$LoggedInUserState {
  @override
  FutureOr<User> build() => User.guest();
}

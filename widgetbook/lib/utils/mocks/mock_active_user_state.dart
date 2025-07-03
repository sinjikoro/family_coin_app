import 'dart:async';

import 'package:family_coin/application/provider/active_user_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockActiveUserState extends ActiveUserState {
  @override
  Future<User?> build() async {
    return null;
  }

  MockActiveUserState(this.dummyUser);

  final User dummyUser;

  @override
  AsyncValue<User?> get state => AsyncValue.data(dummyUser);

  @override
  Future<User?> get future => Future.value(dummyUser);

  @override
  Future<void> refresh() async {}

  @override
  Future<void> reset() async {}

  @override
  Future<void> setActiveUser(User user) async {}

  @override
  Future<User?> update(
    FutureOr<User?> Function(User? p1) cb, {
    FutureOr<User?> Function(Object err, StackTrace stackTrace)? onError,
  }) async => null;

  @override
  bool updateShouldNotify(AsyncValue<User?> previous, AsyncValue<User?> next) =>
      false;
}

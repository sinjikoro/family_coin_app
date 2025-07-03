import 'dart:async';

import 'package:family_coin/application/provider/user_list_state.dart';
import 'package:family_coin/domain/model/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MockUserListState extends UserListState {
  MockUserListState(this.dummyUsers);

  final List<User> dummyUsers;

  @override
  FutureOr<List<User>> build() async => dummyUsers;

  @override
  AsyncValue<List<User>> get state => AsyncValue.data(dummyUsers);

  @override
  Future<void> fetch() async {}
}

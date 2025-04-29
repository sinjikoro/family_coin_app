import 'package:family_coin/domain/repository/user_repository.dart';
import 'package:family_coin/infrastructure/repository/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UserRepositoryのProvider
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => const UserRepositoryImpl(),
);

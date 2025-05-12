import 'package:family_coin/presentation/ui/home/pages/home_page.dart';
import 'package:family_coin/presentation/ui/task/pages/task_list_page.dart';
import 'package:family_coin/presentation/ui/wishItem/pages/wishitem_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

/// ルーターのProvider
@riverpod
GoRouter router(Ref ref) => GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/tasks', builder: (context, state) => const TaskListPage()),
    GoRoute(path: '/wishitems', builder: (context, state) => const WishitemListPage()),
  ],
);

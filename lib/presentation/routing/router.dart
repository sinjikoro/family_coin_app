import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/domain/value_object/wishitem_id.dart';
import 'package:family_coin/presentation/ui/home/pages/home.dart';
import 'package:family_coin/presentation/ui/task/pages/task_detail.dart';
import 'package:family_coin/presentation/ui/task/pages/task_list.dart';
import 'package:family_coin/presentation/ui/wishItem/pages/wishitem_detail.dart';
import 'package:family_coin/presentation/ui/wishItem/pages/wishitem_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

/// アプリケーションのルート状態を管理するプロバイダー
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    debugLogDiagnostics: true,
    // エラーページのハンドリング
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text('エラー: ${state.error}'))),
  ),
);

/// ホーム画面のルート定義
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  /// Constructor
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const Home();
}

/// タスク一覧画面のルート定義
@TypedGoRoute<TaskListRoute>(
  path: '/tasks',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<TaskDetailRoute>(path: ':id'),
  ],
)
class TaskListRoute extends GoRouteData {
  /// Constructor
  const TaskListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TaskList();
}

/// タスク詳細画面のルート定義
class TaskDetailRoute extends GoRouteData {
  /// Constructor
  const TaskDetailRoute({required this.id});

  /// タスクID
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final taskId = Id(id);
    return TaskDetail(taskId: taskId);
  }
}

/// ほしいもの一覧画面のルート定義
@TypedGoRoute<WishitemListRoute>(
  path: '/wishitems',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<WishitemDetailRoute>(path: ':id'),
  ],
)
class WishitemListRoute extends GoRouteData {
  /// constructor
  const WishitemListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WishitemList();
}

/// ほしいもの詳細画面のルート定義
class WishitemDetailRoute extends GoRouteData {
  /// constructor
  const WishitemDetailRoute({required this.id});

  /// ほしいものID
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final wishitemId = WishitemId(id);
    return WishitemDetail(wishitemId: wishitemId);
  }
}

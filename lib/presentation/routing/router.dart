import 'package:family_coin/domain/value_object/id.dart';
import 'package:family_coin/presentation/routing/route_path.dart';
import 'package:family_coin/presentation/ui/home/pages/home_page.dart';
import 'package:family_coin/presentation/ui/task/pages/task_create_page.dart';
import 'package:family_coin/presentation/ui/task/pages/task_detail_page.dart';
import 'package:family_coin/presentation/ui/task/pages/task_list_page.dart';
import 'package:family_coin/presentation/ui/wishItem/pages/wishitem_create_page.dart';
import 'package:family_coin/presentation/ui/wishItem/pages/wishitem_detail_page.dart';
import 'package:family_coin/presentation/ui/wishItem/pages/wishitem_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

/// アプリケーションのルート状態を管理するプロバイダー
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: $appRoutes,
    initialLocation: RoutePath.home,
    debugLogDiagnostics: true,
    // エラーページのハンドリング
    // TODO(naga): エラーページのハンドリングを追加する
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('エラー: ${state.error}'))),
  ),
);

/// ホーム画面のルート定義
@TypedGoRoute<HomeRoute>(path: RoutePath.home)
class HomeRoute extends GoRouteData {
  /// Constructor
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

/// タスク一覧画面のルート定義
@TypedGoRoute<TaskListRoute>(
  path: RoutePath.taskList,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<TaskCreateRoute>(path: 'new'),
    TypedGoRoute<TaskDetailRoute>(path: ':id'),
  ],
)
class TaskListRoute extends GoRouteData {
  /// Constructor
  const TaskListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TaskListPage();
}

/// タスク作成画面のルート定義
class TaskCreateRoute extends GoRouteData {
  /// Constructor
  const TaskCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TaskCreatePage();
}

/// タスク詳細画面のルート定義
class TaskDetailRoute extends GoRouteData {
  /// Constructor
  const TaskDetailRoute({required this.id});

  /// タスクID
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final taskId = TaskId(id);
    return TaskDetailPage(taskId: taskId);
  }
}

/// ほしいもの一覧画面のルート定義
@TypedGoRoute<WishitemListRoute>(
  path: RoutePath.wishItemList,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<WishitemCreateRoute>(path: 'new'),
    TypedGoRoute<WishitemDetailRoute>(path: ':id'),
  ],
)
class WishitemListRoute extends GoRouteData {
  /// constructor
  const WishitemListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WishitemListPage();
}

/// ほしいもの詳細画面のルート定義
class WishitemCreateRoute extends GoRouteData {
  /// constructor
  const WishitemCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WishitemCreatePage();
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
    return WishitemDetailPage(wishitemId: wishitemId);
  }
}

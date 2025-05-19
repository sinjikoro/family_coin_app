// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $homeRoute,
  $taskListRoute,
  $wishitemListRoute,
];

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', factory: $HomeRouteExtension._fromState);

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $taskListRoute => GoRouteData.$route(
  path: '/tasks',

  factory: $TaskListRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: 'new',

      factory: $TaskCreateRouteExtension._fromState,
    ),
    GoRouteData.$route(
      path: ':id',

      factory: $TaskDetailRouteExtension._fromState,
    ),
  ],
);

extension $TaskListRouteExtension on TaskListRoute {
  static TaskListRoute _fromState(GoRouterState state) => const TaskListRoute();

  String get location => GoRouteData.$location('/tasks');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TaskCreateRouteExtension on TaskCreateRoute {
  static TaskCreateRoute _fromState(GoRouterState state) =>
      const TaskCreateRoute();

  String get location => GoRouteData.$location('/tasks/new');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TaskDetailRouteExtension on TaskDetailRoute {
  static TaskDetailRoute _fromState(GoRouterState state) =>
      TaskDetailRoute(id: int.parse(state.pathParameters['id']!)!);

  String get location =>
      GoRouteData.$location('/tasks/${Uri.encodeComponent(id.toString())}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $wishitemListRoute => GoRouteData.$route(
  path: '/wish-items',

  factory: $WishitemListRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: ':id',

      factory: $WishitemDetailRouteExtension._fromState,
    ),
  ],
);

extension $WishitemListRouteExtension on WishitemListRoute {
  static WishitemListRoute _fromState(GoRouterState state) =>
      const WishitemListRoute();

  String get location => GoRouteData.$location('/wish-items');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WishitemDetailRouteExtension on WishitemDetailRoute {
  static WishitemDetailRoute _fromState(GoRouterState state) =>
      WishitemDetailRoute(id: int.parse(state.pathParameters['id']!)!);

  String get location => GoRouteData.$location(
    '/wish-items/${Uri.encodeComponent(id.toString())}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

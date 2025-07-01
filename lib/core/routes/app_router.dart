import 'package:go_router/go_router.dart';
import 'package:task/core/routes/bottom_nav.dart';
import 'package:task/core/routes/favorites_router.dart';
import 'package:task/core/routes/home_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNav(child: child);
      },
      routes: [
        ...homeRoutes,
        ...favoritesRouter,
    ]),
  ],
);

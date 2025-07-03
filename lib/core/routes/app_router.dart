import 'package:go_router/go_router.dart';
import 'package:task/core/routes/bottom_nav.dart';
import 'package:task/features/favorite/presentation/screens/favorites_screen.dart';
import 'package:task/features/home/presentation/screens/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNav(child: child);
      },
      routes: [
        GoRoute(path: "/", builder: (context, state) => HomeScreen()),
        GoRoute(
          path: "/favorites",
          builder: (context, state) => FavoritesScreen(),
        ),
      ],
    ),
  ],
);

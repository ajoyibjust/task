import 'package:go_router/go_router.dart';
import 'package:task/features/presentation/screens/favorites_screen.dart';

final favoritesRouter = [
  GoRoute(path: "/favorites", builder: (context, state) => FavoritesScreen()),
];

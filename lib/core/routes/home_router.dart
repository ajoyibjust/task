import 'package:go_router/go_router.dart';
import 'package:task/features/presentation/screens/home_screen.dart';

final homeRoutes = [
  GoRoute(path: "/", builder: (context, state) => HomeScreen(),)
];
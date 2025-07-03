import 'package:flutter/material.dart';
import 'core/di/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/routes/app_router.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_bloc.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_event.dart';
import 'package:task/features/home/presentation/blocs/product_event.dart';
import 'package:task/features/home/presentation/blocs/products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("products");
  await Hive.openBox("favorite");
  await di.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteBloc(
            addFavorite: di.sl(),
            getFavorite: di.sl(),
            removeFavorite: di.sl(),
            isFavorite: di.sl(),
          )..add(FavoriteGet()),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(di.sl())..add(LoadProducts()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}

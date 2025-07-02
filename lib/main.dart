import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/routes/app_router.dart';
import 'package:task/features/data/datasources/favorites_local_data_source.dart';
import 'package:task/features/data/datasources/product_remote_data_source.dart';
import 'package:task/features/data/repositories/favorites_repositories_impl.dart';
import 'package:task/features/data/repositories/product_repositories_impl.dart';
import 'package:task/features/domain/useceses/get_all_products.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_event.dart';
import 'package:task/features/presentation/blocs/product_bloc/product_event.dart';
import 'package:task/features/presentation/blocs/product_bloc/products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("products");
  await Hive.openBox("favorite");
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
            FavoritesRepositoryImpl(local: FavoritesLocalDatasourceImpl()),
          )..add(FavoriteGet()),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(
            GetAllProducts(
              repository: ProductRepositoriesImpl(
                remoteDataSource: ProductRemoteDataSource(),
              ),
            ),
          )..add(LoadProducts()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}

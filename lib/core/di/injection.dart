import 'package:get_it/get_it.dart';
import 'package:task/features/favorite/data/datasources/favorites_local_data_source.dart';
import 'package:task/features/favorite/data/repositories/favorites_repositories_impl.dart';
import 'package:task/features/favorite/domain/repository/favorites_repository.dart';
import 'package:task/features/favorite/domain/useceses/add_favorite.dart';
import 'package:task/features/favorite/domain/useceses/get_favorite.dart';
import 'package:task/features/favorite/domain/useceses/is_favorite.dart';
import 'package:task/features/favorite/domain/useceses/remove_favorite.dart';
import 'package:task/features/home/data/datasources/product_local_data_source.dart';
import 'package:task/features/home/data/datasources/product_remote_data_source.dart';
import 'package:task/features/home/data/repositories/product_repositories_impl.dart';
import 'package:task/features/home/domain/repositories/product_repositories.dart';
import 'package:task/features/home/domain/useceses/get_all_products.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(local: sl()),
  );

  sl.registerLazySingleton(() => AddFavorite(sl()));
  sl.registerLazySingleton(() => GetFavorite(sl()));
  sl.registerLazySingleton(() => RemoveFavorite(sl()));
  sl.registerLazySingleton(() => IsFavorite(sl()));

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(),
  );
  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSource(),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoriesImpl(remote: sl(), local: sl()),
  );

  sl.registerLazySingleton(() => GetAllProducts(sl()));
}

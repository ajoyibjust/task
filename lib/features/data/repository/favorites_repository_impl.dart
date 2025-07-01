import 'package:task/features/data/datasources/favorites_local_datasource.dart';
import 'package:task/features/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDatasource local;

  FavoritesRepositoryImpl({required this.local});
  @override
  Future<void> addFavorite(Map<String, dynamic> favoride) {
    return local.addFavorite(favoride);
  }

  @override
  Future<List<Map<String, dynamic>>> getFavorite() {
    return local.getFavorite();
  }

  @override
  Future<void> removeFavorite(int id) {
    return local.removeFavorite(id);
  }

  @override
  Future<bool> isFavorite(int id) {
    return local.isFavorite(id);
  }
}

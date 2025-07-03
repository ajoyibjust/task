import 'package:task/features/favorite/data/datasources/favorites_local_data_source.dart';
import 'package:task/features/favorite/domain/repository/favorites_repository.dart';
import 'package:task/features/home/domain/entities/favorite_entity.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource local;

  FavoritesRepositoryImpl({required this.local});
  @override
  Future<void> addFavorite(FavoriteEntity favoride) async {
    return await local.addFavorite(favoride);
  }

  @override
  Future<List<FavoriteEntity>> getFavorite() async {
    return await local.getFavorite();
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

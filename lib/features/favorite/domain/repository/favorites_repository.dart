import 'package:task/features/home/domain/entities/favorite_entity.dart';

abstract class FavoritesRepository {
  Future<void> addFavorite(FavoriteEntity product);
  Future<List<FavoriteEntity>> getFavorite();
  Future<void> removeFavorite(int id);
  Future<bool> isFavorite(int id);
}

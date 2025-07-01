abstract class FavoritesRepository {
  Future<void> addFavorite(Map<String, dynamic> product);
  Future<List<Map<String, dynamic>>> getFavorite();
  Future<void> removeFavorite(int id);
  Future<bool> isFavorite(int id);
}
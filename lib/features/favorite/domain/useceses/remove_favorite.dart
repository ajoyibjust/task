import 'package:task/features/favorite/domain/repository/favorites_repository.dart';

class RemoveFavorite {
  final FavoritesRepository repository;

  RemoveFavorite(this.repository);

  Future<void> call(int id) async {
    return await repository.removeFavorite(id);
  }
}

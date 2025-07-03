import 'package:task/features/favorite/domain/repository/favorites_repository.dart';
import 'package:task/features/home/domain/entities/favorite_entity.dart';

class AddFavorite {
  final FavoritesRepository repository;

  AddFavorite(this.repository);

  Future<void> call(FavoriteEntity product) async {
    repository.addFavorite(product);
  }
}

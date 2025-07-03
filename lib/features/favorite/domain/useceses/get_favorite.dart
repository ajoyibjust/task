import 'package:task/features/favorite/domain/repository/favorites_repository.dart';
import 'package:task/features/home/domain/entities/favorite_entity.dart';

class GetFavorite {
  final FavoritesRepository repository;

  GetFavorite(this.repository);

  Future<List<FavoriteEntity>> call() async {
    return await repository.getFavorite();
  }
}

import 'package:task/features/favorite/domain/repository/favorites_repository.dart';

class IsFavorite {
  final FavoritesRepository repository;

  IsFavorite(this.repository);

  Future<bool> call(int id) async {
    return await repository.isFavorite(id);
  }
}

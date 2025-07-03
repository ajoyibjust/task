import 'package:task/features/home/domain/entities/favorite_entity.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorite;

  FavoriteLoaded(this.favorite);
}

class FavoriteStatus extends FavoriteState {
  final bool isFavorite;

  FavoriteStatus(this.isFavorite);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}

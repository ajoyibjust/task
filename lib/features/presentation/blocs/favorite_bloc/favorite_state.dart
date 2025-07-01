abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<Map<String, dynamic>> favorite;

  FavoriteLoaded(this.favorite);
}

class FavoriteStatus extends FavoriteState {
  final bool isFav;

  FavoriteStatus(this.isFav);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}


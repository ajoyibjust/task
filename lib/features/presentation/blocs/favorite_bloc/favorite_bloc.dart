import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/domain/repositories/favorites_repository.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_event.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoritesRepository repository;

  FavoriteBloc(this.repository) : super(FavoriteInitial()) {
    on<FavoriteAdd>(_add);
    on<FavoriteGet>(_get);
    on<FavoriteRemove>(_remove);
    on<FavoriteCheck>(_check);
  }
  Future<void> _add(FavoriteAdd event, Emitter<FavoriteState> emit) async {
    await repository.addFavorite(event.product);
    add(FavoriteGet());
  }

  Future<void> _get(FavoriteGet event, Emitter<FavoriteState> emit) async {
    final favorites = await repository.getFavorite();
    emit(FavoriteLoaded(favorites));
  }

  Future<void> _remove(
    FavoriteRemove event,
    Emitter<FavoriteState> emit,
  ) async {
    await repository.removeFavorite(event.id);
    add(FavoriteGet());
  }

  Future<void> _check(FavoriteCheck event, Emitter<FavoriteState> emit) async {
    final isFavorite = await repository.isFavorite(event.id);
    emit(FavoriteStatus(isFavorite));
  }
}

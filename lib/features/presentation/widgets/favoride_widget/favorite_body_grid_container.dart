import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/domain/entities/favorite_entity.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_event.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_state.dart';

class FavoriteBodyGridContainer extends StatelessWidget {
  final FavoriteEntity data;
  const FavoriteBodyGridContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.shade50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(child: Image.network(data.image, width: 80)),
                ),
              ),
              Positioned(
                top: -5,
                right: -5,
                child: BlocBuilder<FavoriteBloc, FavoriteState>(
                  builder: (context, state) {
                    bool isFav = false;
                    if (state is FavoriteLoaded) {
                      isFav = state.favorite.any((e) => e.id == data.id);
                    }
                    return IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: isFav ? Colors.red : null,
                      ),
                      onPressed: () {
                       context.read<FavoriteBloc>().add(FavoriteRemove(data.id));
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          Text(data.title, maxLines: 1),
          Row(
            children: [
              Text(data.price.toString()),
              Spacer(),
              Icon(Icons.star_rate_rounded, color: Colors.amber),
              Text(data.rating.rate.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

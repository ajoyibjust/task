import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_bloc.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_event.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_state.dart';
import 'package:task/features/home/domain/entities/favorite_entity.dart';

class HomeBodyGridContainer extends StatelessWidget {
  final FavoriteEntity data;
  const HomeBodyGridContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: 0.95,
      duration: Duration(milliseconds: 300),
      onPressed: () {},
      child: Container(
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
                  top: 5,
                  right: 5,
                  child: BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                      bool isFav = false;
                      if (state is FavoriteLoaded) {
                        isFav = state.favorite.any((e) => e.id == data.id);
                      }
                      return ScaleTap(
                        scaleMinValue: 2,
                        opacityMinValue: 0.5,
                        duration: Duration(milliseconds: 500),
                        onPressed: () {
                          if (isFav) {
                            context.read<FavoriteBloc>().add(
                              FavoriteRemove(data.id),
                            );
                          } else {
                            context.read<FavoriteBloc>().add(FavoriteAdd(data));
                          }
                        },

                        child: Icon(
                          Icons.favorite,
                          color: isFav ? Colors.red : null,
                        ),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_bloc.dart';
import 'package:task/features/favorite/presentation/blocs/favorite_state.dart';
import 'package:task/features/favorite/presentation/widgets/favorites_body_grid.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoaded) {
                    return FavoriteBodyGrid(state: state.favorite);
                  }
                  return Center(child: Text("Kutulmagan Xatolik"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

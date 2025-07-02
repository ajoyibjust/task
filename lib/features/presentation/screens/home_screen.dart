import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/domain/entities/favorite_entity.dart';
import 'package:task/features/presentation/blocs/product_bloc/product_state.dart';
import 'package:task/features/presentation/blocs/product_bloc/products_bloc.dart';
import 'package:task/features/presentation/widgets/home_widget/home_body_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<ProductsBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoding) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductError) {
                    return Center(child: Text(state.message));
                  } else if (state is ProductLoaded) {
                    return HomeBodyGrid(state: state.products.map((e) => FavoriteEntity.toEntity(e)).toList());
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

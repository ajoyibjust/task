import 'package:flutter/material.dart';
import 'package:task/features/data/models/products_model.dart';
import 'package:task/features/presentation/widgets/home_widget/home_body_grid_container.dart';

class HomeBodyGrid extends StatelessWidget {
  final List<ProductsModel> state;
  const HomeBodyGrid({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 230,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: state.length,
      itemBuilder: (context, index) {
        final data = state[index];
        return HomeBodyGridContainer(data: data,);
      },
    );
  }
}

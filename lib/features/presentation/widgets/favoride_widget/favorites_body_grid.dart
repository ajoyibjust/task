import 'package:flutter/material.dart';
import 'package:task/features/presentation/widgets/favoride_widget/favorite_body_grid_container.dart';

class FavoriteBodyGrid extends StatelessWidget {
  final List<Map<String, dynamic>> state;
  const FavoriteBodyGrid({super.key, required this.state});

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
        return FavoriteBodyGridContainer(data: data,);
      },
    );
  }
}

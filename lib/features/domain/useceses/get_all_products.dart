import 'package:task/features/data/models/products_model.dart';
import 'package:task/features/domain/repositories/product_repositories.dart';

class GetAllProducts {
  final ProductRepositories repository;

  GetAllProducts({required this.repository});
  Future<List<ProductsModel>> call() async {
    return repository.getAllProducts();
  }
}

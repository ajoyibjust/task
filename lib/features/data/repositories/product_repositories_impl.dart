import 'package:task/features/data/datasources/product_remote_data_source.dart';
import 'package:task/features/data/models/products_model.dart';
import 'package:task/features/domain/repositories/product_repositories.dart';

class ProductRepositoriesImpl implements ProductRepositories {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoriesImpl({required this.remoteDataSource});
  @override
  Future<List<ProductsModel>> getAllProducts() {
    return remoteDataSource.fetchAllProducts();
  }
}

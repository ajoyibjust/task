import 'package:task/features/data/datasources/product_remote_data_source.dart';
import 'package:task/features/data/models/products_model.dart';
import 'package:task/features/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<ProductsModel>> getAllProducts() {
    return remoteDataSource.fetchAllProducts();
  }
  
}
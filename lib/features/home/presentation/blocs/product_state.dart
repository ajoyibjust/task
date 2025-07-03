import 'package:task/features/home/data/models/products_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoding extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductsModel> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

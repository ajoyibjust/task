import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/features/home/data/models/product_model.dart';
import 'package:task/features/home/data/models/products_model.dart';

class ProductRemoteDataSource {
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<List<ProductsModel>> fetchAllProducts() async {
    try {
      final responce = await http.get(Uri.parse(baseUrl));
      if (responce.statusCode == 200) {
        final List data = jsonDecode(responce.body);
        final List<ProductsModel> res = data
            .map((e) => ProductsModel.fromJson(e))
            .toList();
        return res;
      } else {
        throw Exception("Server error: ${responce.statusCode}");
      }
    } catch (e) {
      throw Exception("Kutilmagan xatolik: $e");
    }
  }

  Future<List<ProductModel>> fetchOneProduct(int id) async {
    try {
      final responce = await http.get(Uri.parse("{$baseUrl/$id}"));
      if (responce.statusCode == 200) {
        final List data = jsonDecode(responce.body);
        final List<ProductModel> res = data
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return res;
      } else {
        throw Exception("Server error: ${responce.statusCode}");
      }
    } catch (e) {
      throw Exception("Kutilmagan xatolik: $e");
    }
  }
}

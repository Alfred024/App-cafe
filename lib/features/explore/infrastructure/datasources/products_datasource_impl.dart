import 'package:app_cafe/features/explore/infrastructure/infrastructure.dart';
import 'package:dio/dio.dart';
import 'package:app_cafe/config/constants/environment.dart';

import 'package:app_cafe/features/explore/domain/domain.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';

class ProductsDatasourceImpl implements ProductsDatasource {
  late final Dio dio;
  final String jwtoken;

  ProductsDatasourceImpl({required this.jwtoken}) {
    dio = Dio(BaseOptions(
        baseUrl: Environment.apiUrl,
        connectTimeout: const Duration(milliseconds: 8000),
        receiveTimeout: const Duration(milliseconds: 8000),
        headers: {'Authorization': 'Bearer $jwtoken'}));
  }

  List<Product> _getProductsList(Response<List<dynamic>> apiResponse) {
    final List<Product> products = [];

    for (final product in apiResponse.data ?? []) {
      products.add(ProductMapper.jsonEntityToProduct(product));
    }
    return products;
  }

  @override
  Future<Product> getProductById(int productId) async {
    try {
      final response =
          await dio.get<Map<String, dynamic>>('/products/$productId');

      final product = ProductMapper.jsonEntityToProduct(response.data ?? {});
      return product;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  // TODO: Implementar un parámetro para que limite la cantidad de productos
  @override
  Future<List<Product>> getProducts({int productsQuantity = 20}) async {
    try {
      final response = await dio.get<List>('/products');
      return _getProductsList(response);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category,
      {int productsQuantity = 10}) async {
    try {
      final response = await dio.get<List>('/products/$category');
      return _getProductsList(response);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<Product>> getProductsByClasification(String clasification,
      {int productsQuantity = 10}) async {
    try {
      final response = await dio.get<List>('/products/$clasification');
      return _getProductsList(response);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

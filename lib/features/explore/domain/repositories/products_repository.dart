import 'package:app_cafe/features/products/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts({int productsQuantity = 10});

  Future<List<Product>> getProductsByCategory(String category,
      {int productsQuantity = 10});

  Future<List<Product>> getProductsByClasification(String clasification,
      {int productsQuantity = 10});
}

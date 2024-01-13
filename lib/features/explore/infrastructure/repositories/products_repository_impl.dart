import 'package:app_cafe/features/explore/domain/domain.dart';
import 'package:app_cafe/features/explore/infrastructure/datasources/products_datasource_impl.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDatasource productsDatasource;
  final String jwtoken;

  ProductsRepositoryImpl(
      {ProductsDatasource? productsDatasource, required this.jwtoken})
      : productsDatasource =
            productsDatasource ?? ProductsDatasourceImpl(jwtoken: jwtoken);

  @override
  Future<Product> getProductById(int productId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts({int productsQuantity = 10}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByCategory(String category,
      {int productsQuantity = 10}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByClasification(String clasification,
      {int productsQuantity = 10}) {
    throw UnimplementedError();
  }
}

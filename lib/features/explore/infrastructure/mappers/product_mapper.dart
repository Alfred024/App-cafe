import 'package:app_cafe/features/products/domain/entities/product.dart';

class ProductMapper {
  static jsonEntityToProduct(Map<String, dynamic> json) => Product(
      id: json[''],
      title: json[''],
      description: json[''],
      imageUrl: json[''],
      price: json[''],
      available: json[''],
      categories: json[''],
      clasifications: json['']);
}

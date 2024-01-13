import 'package:app_cafe/features/explore/domain/repositories/products_repository.dart';
import 'package:app_cafe/features/products/presentation/providers/products_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsStateNotifierProvider =
    StateNotifierProvider<ProductStateNotifier, ProductState>((ref) {
  // necesitamos leer el token de shared preferences o crear un nuevo provider
  final productsRepository = ref.watch(productsRepositoryProvider);

  return ProductStateNotifier(productsRepository: productsRepository);
});

class ProductStateNotifier extends StateNotifier<ProductState> {
  final ProductsRepository productsRepository;

  ProductStateNotifier({required this.productsRepository})
      : super(ProductState());
}

class ProductState {}

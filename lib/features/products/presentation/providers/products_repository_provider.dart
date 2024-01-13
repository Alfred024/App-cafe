// Esta clase es la encargada de pasarle el repositorio con el token actualizado directo al ProductsProvider

import 'package:app_cafe/features/auth/presentation/providers/auth_provider.dart';
import 'package:app_cafe/features/explore/domain/domain.dart';
import 'package:app_cafe/features/explore/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final jwtoken = ref.watch(authNotifierProvider).user?.token;
  final productsRepository = ProductsRepositoryImpl(jwtoken: jwtoken ?? '');
  return productsRepository;
});

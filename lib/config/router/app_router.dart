import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:app_cafe/features/products/presentation/screens/product_info_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/explore/presentation/screens/home_screen.dart';

final product = Product(
  id: 1,
  title: 'Hamburguesa con papa',
  imageUrl:
      'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=600',
  price: 60.0,
  description:
      'Una hamburguesa acompañada con una ración de papas fritas. Incluye un vaso de agua de sabor',
  categories: ['food'],
  clasifications: ['popular'],
  available: true,
);

// final appRouter = GoRouter
final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndexString = state.pathParameters['page'] ?? '0';
        final pageIndex = int.parse(pageIndexString);
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'food-info/:id',
          builder: (context, state) => ProductInfoScreen(product: product),
        )
      ]),
  GoRoute(path: '/', redirect: (_, __) => '/home/0'),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: '/food-info',
    builder: (context, state) => ProductInfoScreen(
      product: product,
    ),
  ),
]);

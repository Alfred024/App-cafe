import 'package:app_cafe/config/router/app_router_notifier.dart';
import 'package:app_cafe/features/auth/presentation/providers/auth_provider.dart';
import 'package:app_cafe/features/products/presentation/screens/product_info_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Features Screens
import '../../features/auth/presentation/screens/screens.dart';
import '../../features/explore/presentation/screens/screens.dart';

//Providers

// final appRouter = GoRouter
final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
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
              path: 'products/:category',
              builder: (context, state) {
                final category =
                    state.pathParameters['category'] ?? 'no-category';
                return ProductsByCategoryScreen(
                  category: category,
                );
              },
            ),
            GoRoute(
              path: 'food-info/:id',
              builder: (context, state) {
                final productId = state.pathParameters['id'] ?? 'No id founded';
                return ProductInfoScreen(
                  productId: int.parse(productId),
                );
              },
            ),
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
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
  );
});

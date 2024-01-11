//Dependencies
import 'package:app_cafe/config/router/app_router_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Features Screens
import '../../features/products/presentation/screens/product_info_screen.dart';
import '../../features/auth/presentation/screens/screens.dart';
import '../../features/explore/presentation/screens/home_screen.dart';

//Providers
import '../../features/auth/presentation/providers/auth_provider.dart';

final goRouterProvider = Provider((ref) {
  final appRouterNotifier = ref.read(appRouterNotifierProvider);

  return GoRouter(
    //initialLocation: '/splash',
    initialLocation: '/login',
    refreshListenable: appRouterNotifier,
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
              path: 'food-info/:id',
              builder: (context, state) => const ProductInfoScreen(),
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
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.path;
      final authStatus = appRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking)
        return null;

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/home/0';
        }
      }

      return null;
    },
  );
});

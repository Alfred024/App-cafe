// Dependencies
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Widgets
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:app_cafe/features/explore/presentation/widgets/widgets.dart';
// Screen
import 'package:app_cafe/features/custom_app/presentation/screens/profile_screen.dart';
import 'package:app_cafe/features/products/presentation/screens/shopping_cart_screen.dart';

import 'package:app_cafe/features/explore/data/food_dishes_list.dart';

import '../../../../config/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  HomeScreen({super.key, required this.pageIndex});

  final pageRoutes = <Widget>[
    // feature : explore
    const HomeView(),

    // feature : products
    ShoppingCartScreen(),

    // feature : custom_app
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pageRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: pageIndex),
    );
  }
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Reemplazar por ref.watch(productsNotifierPorvider);
    final popularFoodDishes = localFoodData
        .where((product) =>
            product.clasifications.any((category) => category == 'popular'))
        .toList();
    final quickPreparedFoodishes = localFoodData
        .where((product) => product.clasifications
            .any((category) => category == 'quick_prepared'))
        .toList();

    return SafeArea(
      //top: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SearchBarField(),
            const _CategoriesList(),
            ProductsHorizontalListView(
                products: popularFoodDishes, title: 'Popular food'),
            const SizedBox(
              height: 20,
            ),
            ProductsHorizontalListView(
                products: quickPreparedFoodishes, title: 'Quick prepare food'),
            const SizedBox(
              height: 20,
            ),
            ProductsVerticalListView(
              products: popularFoodDishes,
              title: 'Encuentra tu platillo favorito',
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList();

  @override
  Widget build(BuildContext context) {
    final buttonCategoryStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          return AppTheme().getTheme().primaryColor;
        },
      ),
    );

    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 40),
      child: SizedBox(
          width: double.infinity,
          height: 25,
          child: Wrap(
            //scrollDirection: Axis.horizontal,
            alignment: WrapAlignment.spaceAround,
            children: [
              FilledButton.icon(
                  style: buttonCategoryStyle,
                  onPressed: () {
                    context.push('/home/0/products/food');
                  },
                  icon: const Icon(Icons.food_bank),
                  label: const Text('Comida')),
              FilledButton.icon(
                  style: buttonCategoryStyle,
                  onPressed: () {
                    context.push('/home/0/products/drinks');
                  },
                  icon: const Icon(Icons.local_drink),
                  label: const Text('Bebida')),
              FilledButton.icon(
                  style: buttonCategoryStyle,
                  onPressed: () {
                    context.push('/home/0/products/snacks');
                  },
                  icon: const Icon(Icons.food_bank_sharp),
                  label: const Text('Snacks')),
            ],
          )),
    );
  }
}

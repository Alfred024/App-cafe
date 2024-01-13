// Dependencies
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';

class ProductsHorizontalListView extends StatelessWidget {
  final List<Product> products;
  final String title;

  const ProductsHorizontalListView(
      {super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme().getTheme().textTheme;

    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(title, style: textTheme.titleSmall)),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _FoodDishSlide(product: product);
                  }))
        ],
      ),
    );
  }
}

class _FoodDishSlide extends StatelessWidget {
  final Product product;
  const _FoodDishSlide({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 180,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              fit: BoxFit.cover,
              product.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ));
                }
                return GestureDetector(
                    onTap: () {
                      context.push('/home/0/food-info/${product.id}');
                    },
                    child: FadeIn(
                      child: child,
                    ));
              },
            ),
          ),
          const BackgroundGradient(),
          Positioned(
              bottom: 30,
              left: 5,
              child: Text(
                product.title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              )),
          Positioned(
              bottom: 10,
              left: 5,
              child: Text(
                '\$${product.price}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              )),
        ],
      ),
    );
  }
}

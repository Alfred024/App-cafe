import 'package:animate_do/animate_do.dart';
import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
// Agregar la dependencia go_router
//import 'package:go_router/go_router.dart';

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
                    final foodDish = products[index];
                    return _FoodDishSlide(foodDish: foodDish);
                  }))
        ],
      ),
    );
  }
}

class _FoodDishSlide extends StatelessWidget {
  final Product foodDish;
  const _FoodDishSlide({required this.foodDish});

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
              foodDish.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ));
                }
                return GestureDetector(
                    //onTap: () => context.push('/home/0/food-info/${foodDish.id}'),
                    onTap: () {},
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
                foodDish.title,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              )),
          Positioned(
              bottom: 10,
              left: 5,
              child: Text(
                '\$${foodDish.price}',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              )),
        ],
      ),
    );
  }
}

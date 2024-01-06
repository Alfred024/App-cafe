import 'package:animate_do/animate_do.dart';
import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
// Agregar la dependencia go_router
//import 'package:go_router/go_router.dart';

class ProductsVerticalListView extends StatelessWidget {
  final String title;
  final List<Product> products;
  const ProductsVerticalListView(
      {super.key, required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme().getTheme().textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: textTheme.titleMedium,
        ),

        // Container(
        //   height: 500,
        //   child: ListView.builder(
        //       physics: const BouncingScrollPhysics(),
        //       itemCount: products.length,
        //       itemBuilder: (context, index) {
        //         final product = products[index];
        //         return _FoodDishCard(product: product);
        //       }),
        // ),

        _FoodDishCard(product: products[0]),
        _FoodDishCard(product: products[1]),
        _FoodDishCard(product: products[2]),
        _FoodDishCard(product: products[3]),
        _FoodDishCard(product: products[1]),
        _FoodDishCard(product: products[2]),
      ],
    );
  }
}

class _FoodDishCard extends StatelessWidget {
  final Product product;
  const _FoodDishCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final cardDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 240, 203, 200),
              blurRadius: 10,
              offset: Offset(-5, -5)),
        ],
        image: DecorationImage(
            image: AssetImage(product.imageUrl), fit: BoxFit.cover));

    return Container(
      //width: double.infinity,
      height: 220,
      margin: const EdgeInsetsDirectional.all(15),
      //padding: const EdgeInsetsDirectional.all(15),
      decoration: cardDecoration,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              //fit: BoxFit.cover,
              product.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ));
                }
                return GestureDetector(
                    onTap: () {},
                    //onTap: () => context.push('/home/0/food-info/${product.id}'),
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

import 'package:app_cafe/features/products/presentation/widgets/food_info_bezier_curve_clipper.dart';
import 'package:app_cafe/features/products/presentation/widgets/product_quantity_selector.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../../config/theme/app_theme.dart';


class ProductInfoScreen extends StatelessWidget {
  //final Product product;

  const ProductInfoScreen({
    super.key, required product,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppTheme().getTheme().colorScheme;

    return Scaffold(
      //Agregar el botón de me gusta a la derecha
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            const _MovieImageSection(
                foodDishUrl:
                    'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=600'),
            const _ProductInfoSection(
              title: 'Hamburguesacon papas',
              price: 60,
              description: 'Una hamburguesa acompañada con una ración de papas fritas. Incluye un vaso de agua de sabor',
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              height: 70,
              width: double.infinity,
              child: CustomFilledButton(
                radius: const Radius.circular(25),
                text: 'Agregar al carrito',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieImageSection extends StatelessWidget {
  final String foodDishUrl;

  const _MovieImageSection({required this.foodDishUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = AppTheme().getTheme().colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          ClipPath(
            clipper: FoodInfoBezierCurveClipper(size: size),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.primary,
              ),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.network(foodDishUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductInfoSection extends StatelessWidget {
  final String title;
  final double price;
  final String description;

  const _ProductInfoSection(
      {required this.title, required this.price, required this.description});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme().getTheme().textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      //width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                '\$$price',
                style: textTheme.displayLarge,
              ),
              const Spacer(),
              const ProductQuantitySelector(
                itemsCounter: 1,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

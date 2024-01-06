import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:app_cafe/features/products/presentation/widgets/product_quantity_selector.dart';
import 'package:flutter/material.dart';

class ProductCartItem extends StatelessWidget {
  final int itemsCounter;
  final Product product;

  const ProductCartItem(
      {super.key, required this.product, required this.itemsCounter});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheeme = AppTheme().getTheme().colorScheme;
    final cardDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: colorScheeme.surface);

    //Meterle boxShadow
    final imageDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(product.imageUrl), fit: BoxFit.cover));

    return Container(
      padding: const EdgeInsets.all(8),
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * 0.27,
            decoration: imageDecoration,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            decoration: cardDecoration,
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140,
                      child: Text(
                        product.title,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    const Spacer(),
                    ProductQuantitySelector(
                      itemsCounter: itemsCounter,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

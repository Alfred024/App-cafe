//import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/explore/data/food_dishes_saved.dart';
import 'package:app_cafe/features/products/presentation/widgets/product_cart_item.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../explore/data/food_dishes_list.dart';
import '../../domain/entities/product.dart';
// Agregar la dependencia go_router
//import 'package:go_router/go_router.dart';

class ShoppingCartScreen extends StatelessWidget {
  final List<Product> products = localFoodData;
  ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Consumir la memoria local donde se guardan los platillos del usuario
    final List<Product> foodDishesSaved = localStoredFoodData;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Cart page')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: foodDishesSaved.length,
                  itemBuilder: (context, index) {
                    final product = foodDishesSaved[index];
                    return ProductCartItem(
                      product: product,
                      itemsCounter: 2,
                    );
                  })),
          const _OrderSubtotal(),
        ],
      ),
    );
  }
}

class _OrderSubtotal extends StatelessWidget {
  const _OrderSubtotal({super.key});
  // TODO: Calcular el subtotal de los productos guardados en el local storage
  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme().getTheme().textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 0.5))),
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Text(
            'Subtotal: \$90',
            style: textTheme.titleMedium,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 220,
            child: CustomFilledButton(
              radius: const Radius.circular(35),
              text: 'Ordenar',
              onPressed: () {
                // TODO: Hacer un POST en el que se actualiza la órden del usuario
                context.push('/home/0/order-details');
              },
            ),
          ),
        ],
      ),
    );
  }
}

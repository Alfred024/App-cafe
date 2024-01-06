//import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/explore/data/food_dishes_saved.dart';
import 'package:app_cafe/features/products/presentation/widgets/product_cart_item.dart';
import 'package:app_cafe/features/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../../explore/data/food_dishes_list.dart';
import '../../domain/entities/product.dart';
// Agregar la dependencia go_router
//import 'package:go_router/go_router.dart';

class ShoppingCartScreen extends StatelessWidget {
  final List<Product> products = localFoodData;
  ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    final List<Product> foodDishesSaved = localStoredFoodData;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              //onPressed: () => context.pop(),
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios)),
          centerTitle: true,
          title: const Text('Cart page')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: foodDishesSaved.length,
                  itemBuilder: (context, index) {
                    final product = foodDishesSaved[index];
                    return ProductCartItem(
                      product: product,
                      itemsCounter:
                          1, //TODO:Implementar aquí el read provider para leer la cantidad de items
                    );
                  })),
          const _OrderInfoContainer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: CustomFilledButton(
              radius: const Radius.circular(15),
              text: 'Ordenar',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderInfoContainer extends StatelessWidget {
  const _OrderInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
    const textStyle2 = TextStyle(fontSize: 21, fontWeight: FontWeight.w600);

    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black45, width: 0.5))),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 100,
      child: const Stack(children: [
        Positioned(
            left: 0,
            top: 0,
            child: Text(
              'Orden',
              style: textStyle1,
            )),
        Positioned(
            left: 0,
            top: 20,
            child: Text(
              'Comisión',
              style: textStyle1,
            )),
        Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              'Total',
              style: textStyle2,
            )),
        Positioned(
            right: 0,
            top: 0,
            child: Text(
              '\$50',
              style: textStyle1,
            )),
        Positioned(
            right: 0,
            top: 20,
            child: Text(
              '\$1',
              style: textStyle1,
            )),
        Positioned(
            right: 0,
            bottom: 0,
            child: Text(
              '\$71',
              style: textStyle2,
            )),
      ]),
    );
  }
}

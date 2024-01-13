import 'package:app_cafe/config/config.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
// Fernando Herrera animate_do
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductsByCategoryScreen extends ConsumerWidget {
  final String category;

  const ProductsByCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Un ref.read (RiverPod) que obtenga los productos con la categoria: 'category'

    return FadeInRight(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => context.pop(),
          ),
          title: Text('Category: $category'),
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: 30,
            itemBuilder: (context, index) {
              //final product = products[index];
              return const _ProductSlide();
            }),
      ),
    );
  }
}

class _ProductSlide extends StatelessWidget {
  // final Product product;
  const _ProductSlide();

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme().getTheme().textTheme;

    return Container(
      height: 400,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  height: 240,
                  fit: BoxFit.cover,
                  'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ));
                    }
                    return GestureDetector(
                        // onTap: () => context.push('/home/0/food-info/productId'),
                        onTap: () {},
                        child: FadeIn(
                          child: child,
                        ));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Espagueti',
                style: textTheme.titleLarge,
              ),
              const Spacer(),
              Text(
                '\$70',
                style: textTheme.displayLarge,
              )
            ],
          ),
          const Text(
              'Espagueto cons espinacasy unas salchicias. voy a poner una descripción más greande para ver cómo queda en el UI final.')
        ],
      ),
    );
  }
}

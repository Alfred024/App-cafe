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
        body: const Center(
          child: Text('Hacer el UI de los productos filtrados'),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';

typedef SearchProductsCallback = Future<List<Product>> Function(String query);

class SearchProductDelegate extends SearchDelegate<Product?> {
  // final SearchProductsCallback searchProducts;
  // List<Product> initialProducts;

  StreamController<List<Product>> debouncedProducts =
      StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchProductDelegate(
      // required this.searchProducts,
      // required this.initialProducts,
      )
      : super(
          searchFieldLabel: 'Buscar productos',
        );

  void clearStreams() {
    debouncedProducts.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    // _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
    //   final products = await searchProducts(query);
    //   initialProducts = products;
    //   debouncedProducts.add(products);
    //   isLoadingStream.add(false);
    // });
  }

  Widget buildResultsAndSuggestions() {
    return const Center(
      child: Text('buildResultsAndSuggestions coming soon'),
    );
    // return StreamBuilder(
    //   initialData: initialProducts,
    //   stream: debouncedProducts.stream,
    //   builder: (context, snapshot) {
    //     final products = snapshot.data ?? [];

    //     return ListView.builder(
    //       itemCount: products.length,
    //       itemBuilder: (context, index) => _ProductItem(
    //         product: products[index],
    //         onProductSelected: (context, product) {
    //           clearStreams();
    //           close(context, product);
    //         },
    //       ),
    //     );
    //   },
    // );
  }

  // @override
  // String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return IconButton(
              onPressed: () => query = '', icon: const Icon(Icons.clear));
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _ProductItem extends StatelessWidget {
  final Product product;
  final Function onProductSelected;

  const _ProductItem({required this.product, required this.onProductSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onProductSelected(context, product);
      },
      child: FadeIn(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              // Image
              SizedBox(
                width: size.width * 0.35,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                      height: 130,
                      fit: BoxFit.cover,
                      image: NetworkImage(product.imageUrl),
                      placeholder:
                          const AssetImage('assets/loaders/bottle-loader.gif'),
                    )),
              ),

              const SizedBox(width: 10),

              // Description
              SizedBox(
                width: size.width * 0.60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: textStyles.titleMedium),
                    (product.description.length > 80)
                        ? Text('${product.description.substring(0, 80)}...')
                        : Text(product.description),
                    Row(
                      children: [
                        const Icon(Icons.monetization_on_outlined,
                            color: Colors.green),
                        const SizedBox(width: 5),
                        Text(
                          product.price.toString(),
                          style: textStyles.bodyMedium!,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

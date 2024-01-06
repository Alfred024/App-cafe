import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:app_cafe/features/explore/presentation/delegates/search_product_delegate.dart';
import 'package:app_cafe/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class SearchBarField extends StatelessWidget {
  final ValueChanged<String>? onValue;
  const SearchBarField({super.key, this.onValue});
  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme().getTheme().textTheme;
    final textController = TextEditingController();

    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black12),
        child: TextField(
          decoration: InputDecoration(
            //enabledBorder: ,
            filled: true,
            fillColor: Colors.transparent,
            border: InputBorder.none,
            hintText: '¿Qué vas a ordenar hoy?',
            hintStyle: textTheme.labelMedium,
            suffixIcon: IconButton(
              onPressed: () {
                showSearch<Product?>(
                  context: context,
                  delegate: SearchProductDelegate(),
                );
              },
              icon: const Icon(Icons.search),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    AppTheme().getTheme().primaryColor),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
          ),
          controller: textController,
        ));
  }
}

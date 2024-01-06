import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int itemsCounter;

  const ProductQuantitySelector({super.key, required this.itemsCounter});

  @override
  Widget build(BuildContext context) {
    final colorScheeme = AppTheme().getTheme().colorScheme;
    final containerDecoration = BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
    );
    final buttonDecoration = BoxDecoration(
        color: colorScheeme.primary, borderRadius: BorderRadius.circular(50));

    return Container(
      width: 100,
      height: 30,
      decoration: containerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: buttonDecoration,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                )),
          ),
          Text(itemsCounter.toString()),
          Container(
            height: 30,
            width: 30,
            decoration: buttonDecoration,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}

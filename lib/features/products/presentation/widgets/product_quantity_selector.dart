import 'package:flutter/material.dart';

class ProductQuantitySelector extends StatelessWidget {
  final int itemsCounter;

  const ProductQuantitySelector({super.key, required this.itemsCounter});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
    );

    return Container(
      width: 100,
      height: 30,
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                )),
          ),
          Text(itemsCounter.toString()),
          SizedBox(
            height: 30,
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

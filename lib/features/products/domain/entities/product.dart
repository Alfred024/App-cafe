class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final bool available;
  final List<String> categories; //Refer if it is food, snack or drink
  final List<String>
      clasifications; //Refer of the caractherstic like popular, or quick prepared..

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.available,
    required this.categories,
    required this.clasifications,
  });
}

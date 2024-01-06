class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final bool available;
  final List<String> categories;
  final List<String> clasifications;

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

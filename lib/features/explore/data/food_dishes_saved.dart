import '../../products/domain/entities/product.dart';

List<Product> localStoredFoodData = [
  Product(
    id: 1,
    title: 'Hamburguesa con papas',
    imageUrl: 'assets/images/burguer.jpg',
    price: 60.0,
    description:
        'Una hamburguesa acompañada con una ración de papas fritas. Incluye un vaso de agua de sabor',
    categories: ['food'],
    clasifications: ['popular'],
    available: true,
  ),
  Product(
    id: 3,
    title: 'Galleta de avena',
    imageUrl: 'assets/images/galleta.jpg',
    price: 20.0,
    description: 'Una galleta de avena horneada. Contiene mucha azúcar',
    categories: ['snack'],
    clasifications: ['popular', 'quick_prepared'],
    available: true,
  ),
  Product(
    id: 4,
    title: 'Hot cakes',
    imageUrl: 'assets/images/hot_cake.jpg',
    price: 50.0,
    description:
        'Una hamburguesa acompañada con una ración de papas fritas. Incluye un vaso de agua de sabor',
    categories: ['food'],
    clasifications: ['popular'],
    available: true,
  ),
  Product(
    id: 5,
    title: 'Sopa',
    imageUrl: 'assets/images/sopa.jpg',
    price: 60.0,
    description:
        'Una hamburguesa acompañada con una ración de papas fritas. Incluye un vaso de agua de sabor',
    categories: ['food'],
    clasifications: ['popular'],
    available: true,
  ),
  Product(
    id: 6,
    title: 'Chilaquiles',
    imageUrl: 'assets/images/chilaquiles.jpg',
    price: 60.0,
    description: 'Unos chilauiles con polo y frijoles y un huevo',
    categories: ['food'],
    clasifications: ['popular'],
    available: true,
  ),
  Product(
    id: 8,
    title: 'Tamal',
    imageUrl: 'assets/images/tamal.jpg',
    price: 60.0,
    description: 'Tamal de queso o rojo o verde o de rajas o dulce o..',
    categories: ['food'],
    clasifications: ['quick_prepared'],
    available: true,
  ),
];

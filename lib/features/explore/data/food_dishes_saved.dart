import '../../products/domain/entities/product.dart';

List<Product> localStoredFoodData = [
  Product(
    id: 1,
    title: 'Hamburguesa con papas',
    imageUrl:
        'https://images.pexels.com/photos/2987564/pexels-photo-2987564.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    //imageUrl: 'assets/images/burguer.jpg',
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
    imageUrl:
        'https://images.pexels.com/photos/6249390/pexels-photo-6249390.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    //imageUrl: 'assets/images/galleta.jpg',
    price: 20.0,
    description: 'Una galleta de avena horneada. Contiene mucha azúcar',
    categories: ['snack'],
    clasifications: ['popular', 'quick_prepared'],
    available: true,
  ),
  Product(
    id: 4,
    title: 'Hot cakes',
    imageUrl:
        'https://www.recetasnestle.com.mx/sites/default/files/srh_recipes/f395e167c1613770edb2b32d44260c80.jpg',
    //imageUrl: 'assets/images/hot_cake.jpg',
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
    imageUrl:
        'https://www.lacostena.com.mx/media/uploads/Recipes/53_sopa_del_huerto_1600.jpg',
    //imageUrl: 'assets/images/sopa.jpg',
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
    imageUrl: 'https://i.ytimg.com/vi/se1daz9UXJ0/maxresdefault.jpg',
    //imageUrl: 'assets/images/chilaquiles.jpg',
    price: 60.0,
    description: 'Unos chilauiles con polo y frijoles y un huevo',
    categories: ['food'],
    clasifications: ['popular'],
    available: true,
  ),
];

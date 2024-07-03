import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../../utils/image_path/images_path.dart';

class ProductController with ChangeNotifier {
  final List<ProductModel>  _list = [
    ProductModel(
      image: AppImages.onLamp,
      name: 'Table Desk Lamp L..',
      subTitle: 'Lamp',
      icon: Icons.favorite,
      price: "\$142.00",
      star: '⭐️(50)',
    ),
    ProductModel(
      image: AppImages.onPaint,
      name: 'Painting Berry Plants',
      subTitle: 'Paint',
      icon: Icons.favorite,
      price: "\$83.00",
      star: '⭐️(4.2)',
    ),
    ProductModel(
      image: AppImages.onPlant,
      name: 'Decorative Plants',
      subTitle: 'Plant',
      icon: Icons.favorite,
      price: "\$105.00",
      star: '⭐️(4.0)',
    ),
    ProductModel(
      image: AppImages.onShelf,
      name: 'Double Well Shelf',
      subTitle: 'Shelf',
      icon: Icons.favorite,
      price: "\$93.00",
      star: '⭐️(4.5)',
    ),
  ];

  List<ProductModel> get list {
    return [..._list];
  }

  void addProduct(ProductModel product) {
    _list.add(product);
    notifyListeners();
  }
}

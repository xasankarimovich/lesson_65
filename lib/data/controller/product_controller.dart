import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lisson_65_state_management/utils/image_path/images_path.dart';

import '../model/product_model.dart';

class ProductController {
  List<ProductModel> _list = [
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
      icon: AppIconsSvg.sertsa2Icon,
      price: "\$83.00",
      star: '⭐️(4.2)',
    ),
    ProductModel(
      image: AppImages.onPlant,
      name: 'Decorative Plants',
      subTitle: 'Plant',
      icon: AppIconsSvg.sertsa2Icon,
      price: "\$105.00",
      star: '⭐️(4.0)',
    ),
    ProductModel(
      image: AppImages.onShelf,
      name: 'Double Well Shelf',
      subTitle: 'Shelf',
      icon: AppIconsSvg.sertsa2Icon,
      price: "\$93.00",
      star: '⭐️(4.5)',
    ),

  ];
  List<ProductModel> get list{
  return [..._list];
  }
}

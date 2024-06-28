import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String subTitle;
  final IconData icon;
  final String price;
  final String star;
  final String image;

  ProductModel({
    required this.image,
    required this.name,
    required this.subTitle,
    required this.icon,
    required this.price,
    required this.star,
  });
}

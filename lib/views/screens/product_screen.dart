import 'package:flutter/material.dart';
import 'package:lesson_65_state_management/utils/extension/extension.dart';
import '../../data/controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController;


  const ProductScreen({super.key, required this.productController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: productController.list.length,
          ), itemBuilder: (ctx,index){
            return Container(
              height: 150.h,
              width: 150.w,
              color: Colors.blueGrey,
            );
          }),
        ),
      ],
    );
  }
}

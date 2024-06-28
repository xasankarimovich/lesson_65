import 'package:flutter/material.dart';
import 'package:lisson_65_state_management/data/controller/product_controller.dart';
import 'package:lisson_65_state_management/utils/extension/extension.dart';
import 'package:lisson_65_state_management/views/screens/product_detail.dart';

import '../../utils/style/app_text_style.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/select_container.dart';

class LivilRoom extends StatelessWidget {
  const LivilRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = ProductController();
    final productCount = productController.list.length;
    return Scaffold(
      appBar: AppBar(

      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CaruselSlider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ContainerSelector(),
                ),
                20.boxH(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Have $productCount products',
                        style: AppTextStyle.semiBold
                            .copyWith(color: Colors.black, fontSize: 30.h),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sort by 🔽',
                          style: AppTextStyle.regular
                              .copyWith(color: Colors.grey, fontSize: 24.h),
                        ),
                      ),
                    ],
                  ),
                ),
                20.boxH(),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 70,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
                crossAxisCount: 2, // Assuming 2 products per row
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final product = productController.list[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) {
                            return ProductDetailsScreen(product: product,);
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -30,
                            left: 0,
                            right: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                product.image,
                                height: 120.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.name,
                                  style: AppTextStyle.semiBold
                                      .copyWith(fontSize: 28),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  product.subTitle,
                                  style: AppTextStyle.regular
                                      .copyWith(color: Colors.grey, fontSize: 24),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      product.price,
                                      style: AppTextStyle.semiBold.copyWith(
                                          fontSize: 26, color: Colors.green),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0, top: 8),
                              child: Text(
                                product.star,
                                style: AppTextStyle.regular
                                    .copyWith(color: Colors.orange, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: productController.list.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

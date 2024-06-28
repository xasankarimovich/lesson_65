import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lisson_65_state_management/views/screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../../data/controller/product_controller.dart';
import '../../data/model/product_model.dart';
import '../../utils/extension/extension.dart';
import '../../utils/style/app_text_style.dart';
import '../widgets/select_container.dart';

class LivingRoomScreen extends StatelessWidget {
  const LivingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    final productCount = productController.list.length;
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CarouselSlider(items: [], options: CarouselOptions(
                    height: 350,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),),
                ),
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
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final product = productController.list[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              ProductDetailsScreen(product: product),
                        ),
                      );
                    },
                    child: ProductCard(product: product),
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

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: AppTextStyle.semiBold.copyWith(fontSize: 28),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product.price,
                      style: AppTextStyle.semiBold
                          .copyWith(fontSize: 26, color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
    );
  }
}

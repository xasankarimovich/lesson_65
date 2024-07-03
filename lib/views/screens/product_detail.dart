import 'package:flutter/material.dart';
import 'package:lesson_65_state_management/utils/extension/extension.dart';
import 'package:lesson_65_state_management/views/screens/payment_success_screen.dart';

import '../../data/model/product_model.dart';
import '../../utils/style/app_text_style.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: Image.asset(
                        widget.product.image,
                        height: 200,
                        width: double.infinity,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Lamp Light',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        40.boxH(),
                        Text(
                          widget.product.subTitle,
                          style: const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        10.boxH(),
                        Text(
                          widget.product.price,
                          style: const TextStyle(fontSize: 24, color: Colors.green),
                        ),
                        10.boxH(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              color: Colors.green,
                              height: 50.h,
                              width: 50.w,
                            ),
                            5.boxW(),
                            Container(
                              color: Colors.green,
                              height: 50.h,
                              width: 50.w,
                            ),
                            5.boxW(),
                            Container(
                              color: Colors.green,
                              height: 50.h,
                              width: 50.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            10.boxH(),
            Text(
              '⭐️ ${widget.product.star}',
              style: const TextStyle(fontSize: 18, color: Colors.orange),
            ),
            const Text(
              'Simple & Minimalist Light',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Lorem ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              height: 70,
              width: 300,
              child: FilledButton(
                style: FilledButton.styleFrom(side: const BorderSide()),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'My Cart',
                                style: AppTextStyle.semiBold.copyWith(
                                    color: Colors.black, fontSize: 30.h),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.green),
                                child: const Text(
                                  '2 Items',
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          FilledButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentSuccessScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Checkout Cart',
                              style: AppTextStyle.semiBold
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Add To Cart',
                  style: AppTextStyle.regular
                      .copyWith(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}

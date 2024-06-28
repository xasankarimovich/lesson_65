import 'package:flutter/material.dart';
import 'package:lisson_65_state_management/data/model/product_model.dart';
import 'package:lisson_65_state_management/utils/extension/extension.dart';
import 'package:lisson_65_state_management/utils/style/app_text_style.dart';
import 'package:lisson_65_state_management/views/screens/payment_success_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({required this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color containerColor1 = Colors.green;
  Color containerColor2 = Colors.green;
  Color containerColor3 = Colors.green;
  String? currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.product.image;
  }

  void _changeColorAndImage(int containerIndex) {
    setState(() {
      switch (containerIndex) {
        case 1:
          containerColor1 = containerColor1 == Colors.green ? Icon(Icons.check);
          break;
        case 2:
          containerColor2 = containerColor2 == Colors.green ? Icon(Icons.check);
          break;
        case 3:
          containerColor3 = containerColor3 == Colors.green ?Icon(Icons.check);
          break;
      }


      // Update the image
      currentImage = containerColor1 == Colors.red
          ? 'https://bloomfield.boutique/9700-home_default/podsvecnik-32sm-ch32sm.jpg'
          : containerColor2 == Colors.red
          ? 'https://bloomfield.boutique/8938-home_default/elocnaa-igruska-cm5aln19705a.jpg'
          : containerColor3 == Colors.red
          ? 'https://bloomfield.boutique/9700-home_default/podsvecnik-32sm-ch32sm.jpg'
          : widget.product.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
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
                    child: AnimatedSwitcher(
                      switchInCurve: Curves.easeInOut,

                      duration: Duration(seconds: 1),
                      child: Image.network(
                        currentImage ?? '',
                        key: ValueKey<String>(currentImage ?? ''),
                        height: 200.h,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('Image not available');
                        },
                      ),

                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Lamp Light',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        40.boxH(),
                        Text(
                          product.subTitle,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        10.boxH(),
                        Text(
                          product.price,
                          style: TextStyle(fontSize: 24, color: Colors.green),
                        ),
                        10.boxH(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => _changeColorAndImage(1),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                color: containerColor1,
                                height: 50.h,
                                width: 50.w,
                              ),
                            ),
                            5.boxW(),
                            GestureDetector(
                              onTap: () => _changeColorAndImage(2),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                color: containerColor2,
                                height: 50.h,
                                width: 50.w,
                              ),
                            ),
                            5.boxW(),
                            GestureDetector(
                              onTap: () => _changeColorAndImage(3),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                color: containerColor3,
                                height: 50.h,
                                width: 50.w,
                              ),
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
              '⭐️ ${product.star}',
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
            Text(
              'Simple & Minimalist Light',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Lorem ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              height: 70,
              width: 300,
              child: FilledButton(
                style: FilledButton.styleFrom(side: BorderSide()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessScreen(),
                    ),
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
        child: Icon(Icons.shopping_cart_outlined),
      ),

    );

  }

}

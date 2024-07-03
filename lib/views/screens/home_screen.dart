import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lesson_65_state_management/views/screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../../data/controller/product_controller.dart';
import '../../utils/extension/extension.dart';
import '../../utils/style/app_text_style.dart';
import '../widgets/draver.dart';
import '../widgets/select_container.dart';
import 'add_images.dart';
import 'livil_room.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    final productCount = productController.list.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            const CustomDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-photo/graphic-designer-digital-avatar-generative-ai_934475-9292.jpg'),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const LivingRoomScreen()),
                    );
                  },
                  child: CarouselSlider(
                    items: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 250.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://i.pinimg.com/736x/8b/11/07/8b110770a0789828f3457b75015cad7d.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 250.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://i.pinimg.com/736x/8b/11/07/8b110770a0789828f3457b75015cad7d.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 250.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://i.pinimg.com/736x/8b/11/07/8b110770a0789828f3457b75015cad7d.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 250.h,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://i.pinimg.com/564x/64/8c/6f/648c6fbc2b4da9c936d70d0468d6d880.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 350,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return const ImagesStorage();
          }));
        },
        child: const Icon(Icons.image),
      ),
    );
  }
}

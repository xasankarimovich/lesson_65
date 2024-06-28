import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lisson_65_state_management/utils/extension/extension.dart';

class CaruselSlider extends StatefulWidget {
  const CaruselSlider({super.key});

  @override
  State<CaruselSlider> createState() => _CaruselSliderState();
}

class _CaruselSliderState extends State<CaruselSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
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
      ),
      items: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Stack(
            children: [
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                decoration: BoxDecoration(
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
    );
  }
}

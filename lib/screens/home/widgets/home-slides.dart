import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion/models/promotion.dart';
import 'package:flutter/material.dart';

class HomeSlides extends StatelessWidget {
  final List<Promotion> items;

  const HomeSlides({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options:
          CarouselOptions(aspectRatio: 2, autoPlay: true, viewportFraction: 1),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(item.image!),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

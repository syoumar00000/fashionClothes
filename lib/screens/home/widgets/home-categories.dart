import 'package:fashion/models/category.dart';
import 'package:flutter/material.dart';
import 'package:fashion/widgets/category/featured-category-card.dart';

class HomeCategories extends StatelessWidget {
  final List<Category> items;

  const HomeCategories({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: items
          .map(
            (e) => FeaturedCategory(
              category: e,
            ),
          )
          .toList(),
    );
  }
}

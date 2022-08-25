import 'package:fashion/models/category.dart';
import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/product/product-list-screen.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ProductProvider>(context, listen: false)
            .getByCategory(category);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductListScreen(),
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(category.image!),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "${category.title}",
              style: kHeadline6(context, Colors.white)
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:fashion/models/category.dart';
import 'package:fashion/providers/product-provider.dart';
import 'package:fashion/screens/product/product-list-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//feature category card used in HomeScreen
class FeaturedCategory extends StatelessWidget {
  final Category category;

  const FeaturedCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<ProductProvider>(context, listen: false)
            .getByCategory(category);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(),
          ),
        );
      },
      child: Container(
        width: 75,
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                category.icon!,
                height: 42,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              category.title!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

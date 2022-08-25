import 'package:fashion/models/product.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/product/product-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//product grid container with title
class HomeProducts extends StatelessWidget {
  //final String title;
  final List<Product> products;
  final Function onMorePress;

  const HomeProducts({
    Key? key,
    // required this.title,
    required this.products,
    required this.onMorePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //products grid
        Padding(
      padding: const EdgeInsets.only(bottom: 300.0, top: 0),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: products[index],
          );
        },
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(1, index.isEven ? 1.1 : 1.25),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
    );
  }
}

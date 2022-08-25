import 'package:fashion/models/product.dart';
import 'package:fashion/screens/product/product-screen.dart';
import 'package:fashion/widgets/input/favorite-button.dart';
import 'package:flutter/material.dart';
import 'package:fashion/widgets/product/product-cart-price.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(product: product),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 10),
            width: 200.0,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              color: Colors.grey.shade300,
            ),
            child: Image.asset(product.image!, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 0),
            child: FavoriteButton(product: product),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.white70,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 3.0, left: 5.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          product.title!,
                          style: const TextStyle(color: Colors.grey),
                          //a revoir
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: ProductCardPrice(product: product),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

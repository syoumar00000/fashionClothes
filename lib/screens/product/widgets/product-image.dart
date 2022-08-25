import 'package:fashion/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fashion/widgets/input/favorite-button.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //product image with favorite button, rate and backbutton
    return Stack(
      children: [
        Image.asset(product.image!),
        //back button
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.all(12),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),
            child: const BackButton(),
          ),
        ),
        //favorite button
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.topRight,
            child: FavoriteButton(product: product),
          ),
        ),
        //rate
        // Positioned(
        //   bottom: 12,
        //   right: 12,
        //   child: Container(
        //     alignment: Alignment.center,
        //     width: 26,
        //     height: 26,
        //     decoration: BoxDecoration(
        //       color: Colors.grey.shade100,
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     child: Text(
        //       product.rate.toString(),
        //     ),
        //   ),
        // ),
      ],
    );
    //--
  }
}

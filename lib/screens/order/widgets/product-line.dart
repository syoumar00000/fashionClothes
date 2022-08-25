import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class ProductLine extends StatelessWidget {
  final CartItem item;
  const ProductLine({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              item.quantity.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kSpaceW(1),
          Text(
            item.product.title!,
            style: kHeadline6(context),
          ),
          const Spacer(),
          Text(
            "$kCurrency${item.total.toStringAsFixed(2)}",
            style: kHeadline6(context),
          ),
        ],
      ),
    );
  }
}

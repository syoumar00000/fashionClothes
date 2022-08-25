import 'package:fashion/models/cart.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/order/widgets/order-row.dart';

//view cart
class OrderCartLine extends StatelessWidget {
  final Cart cart;

  const OrderCartLine({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderRow(
      title: "Cart",
      actionTitle: "view cart",
      action: () {
        Navigator.pushReplacementNamed(context, "/cart");
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
            child: Text(
              cart.cartItems.length.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          kSpaceW(1),
          Text(
            "Items",
            style: kSubtitle1(context)?.copyWith(color: Colors.black),
          ),
          const Spacer(),
          Text(
            cart.totalString,
            style: kSubtitle1(context)?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

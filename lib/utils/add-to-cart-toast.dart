import 'package:fashion/screens/cart/cart-screen.dart';
import 'package:flutter/material.dart';

addToCartAlert(BuildContext context, String title) {
  final snackBar = SnackBar(
    duration: const Duration(
      seconds: 8,
    ),
    content: Text("$title added to cart."),
    action: SnackBarAction(
      label: 'view cart',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

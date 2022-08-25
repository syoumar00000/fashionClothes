import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemConfirm extends StatelessWidget {
  const CartItemConfirm({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: false);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: SizedBox(
          width: kScreenWitdh(context) - 25,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            child: Text(
              "Continue - $kCurrency${cartItem.total.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
            onPressed: () {
              cartState.addToCart(cartItem);
              Navigator.pop(context, true);
            },
          ),
        ),
      ),
    );
  }
}

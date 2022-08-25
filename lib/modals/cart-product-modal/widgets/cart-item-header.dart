import 'package:fashion/models/cart.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/product/product-screen.dart';

class CartItemHeader extends StatelessWidget {
  final CartItem cartItem;
  final bool preview;

  const CartItemHeader({Key? key, required this.cartItem, this.preview = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        kSpaceW(1.5),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            cartItem.product.image!,
            width: 60,
          ),
        ),
        kSpaceW(1),
        Text(
          cartItem.product.title!,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Spacer(),
        if (preview == true)
          IconButton(
            icon: const Icon(
              Icons.visibility_outlined,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    product: cartItem.product,
                  ),
                ),
              );
            },
          )
      ],
    );
  }
}

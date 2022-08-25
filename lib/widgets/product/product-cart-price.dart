import 'package:fashion/modals/cart-product-modal/cart-item-modal.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/models/product.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/utils/add-to-cart-toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCardPrice extends StatelessWidget {
  const ProductCardPrice({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.priceString(product.prices![0]),
              style: kHeadline6(context)?.copyWith(fontWeight: FontWeight.bold),
            ),

            //display discount percent if exits
            /* if (this.product.discount! > 0)
              Text(
                "-" + this.product.discountPercent().toString() + "%",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ) */
          ],
        ),
        /* ElevatedButton(
          onPressed: () async {
            //add to cart from provider
            final cartState = Provider.of<CartProvider>(context, listen: false);
            final CartItem cartItem = cartState.findCartItem(product) ??
                CartItem(
                  product: product,
                  selectedPrice: product.prices![0],
                  quantity: 1,
                );

            cartState.setTempCartItem(
              cartItem,
            );
            //show cart item dialog
            final result = await showCartItem(context, preview: true);

            //show added to cart toast
            if (result == true)
              addToCartAlert(context, cartItem.product.title!);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(40, 30),
            padding: EdgeInsets.symmetric(horizontal: 8),
            primary: Theme.of(context).primaryColor,
            elevation: 0,
          ),
          child: Text(
            "Order",
            style: Theme.of(context).textTheme.button,
          ),
        ), */
      ],
    );
  }
}

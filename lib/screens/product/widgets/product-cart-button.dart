import 'package:fashion/configs/app-config.dart';
import 'package:fashion/modals/cart-product-modal/cart-item-modal.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/models/product.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/styles/button-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/utils/add-to-cart-toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//product screen add to cart button
class ProductCartButton extends StatelessWidget {
  final Product product;
  const ProductCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: false);
    final CartItem? cartItem = cartState.findCartItem(product);

    return Container(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: kBlackButtonStyle,
        child: Text(
          cartItem == null
              ? "Add to cart"
              : "View in cart - $kCurrency${cartItem.total.toStringAsFixed(2)}",
          style: kHeadline6(context, Colors.white),
        ),
        onPressed: () async {
          //set tempory cart item for update or create new;
          cartState.setTempCartItem(
            cartItem ??
                CartItem(
                  product: product,
                  selectedPrice: product.prices![0],
                  quantity: 1,
                ),
          );
          final result = await showCartItem(context, preview: false);
          if (result == true && cartItem != null) {
            addToCartAlert(context, cartItem.product.title!);
          }
        },
      ),
    );
  }
}

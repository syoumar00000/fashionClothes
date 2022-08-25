import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/modals/cart-product-modal/widgets/cart-item-confirm.dart';
import 'package:fashion/modals/cart-product-modal/widgets/cart-item-header.dart';
import 'package:fashion/modals/cart-product-modal/widgets/cart-item-options.dart';
import 'package:fashion/modals/cart-product-modal/widgets/cart-item-quantity.dart';
import 'package:fashion/models/product.dart';
import 'package:provider/provider.dart';

Future<bool?> showCartItem(
  BuildContext context, {
  bool preview = true,
}) {
  return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final cartState = Provider.of<CartProvider>(context, listen: true);
        final cartItem = cartState.tempCartItem!;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => SafeArea(
            child: Container(
              constraints:
                  BoxConstraints(maxHeight: kScreenHeight(context) - 100),
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //header
                        CartItemHeader(
                          cartItem: cartItem,
                          preview: preview,
                        ),
                        kSpaceH(0.75),
                        const Divider(),
                        kSpaceH(0.75),
                        //price option
                        CartItemPriceOptions(
                          currentValue: cartItem.selectedPrice,
                          prices: cartItem.product.prices!,
                          onChanged: (PriceItem? item) {
                            setState(() {
                              cartState.selectPrice(item!);
                            });
                          },
                          //sizes: cartItem.product.size!,
                        ),
                        kSpaceH(0.5),
                        const Divider(),
                        // Text(cartItem.product.size!),
                        kSpaceH(0.5),
                        //product mutilple options
                        ...cartItem.product.options!
                            .map(
                              (option) => CartItemOptions(
                                option: option,
                                currentValue: cartItem.selectedPrice,
                                prices: cartItem.product.prices!,
                                onChanged: (String? value, [bool? checked]) {
                                  setState(() {
                                    if (!option.multiple && value != null)
                                      cartState.setOption(option, value);
                                    else if (option.multiple && value != null)
                                      cartState.setOption(
                                          option, value, checked!);
                                  });
                                },
                              ),
                            )
                            .toList(),
                        //quantity
                        CartItemQuantity(
                          quantity: cartItem.quantity.toString(),
                          onIncrement: (int value) {
                            setState(() {
                              cartState.increment(value);
                            });
                          },
                        ),
                        //remove from cart button if exists
                        if (cartState.findCartItem(cartItem.product) !=
                            null) ...[
                          kSpaceH(2),
                          TextButton(
                            style: TextButton.styleFrom(primary: Colors.red),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.delete_outline),
                                Text("Remove from cart")
                              ],
                            ),
                            onPressed: () {
                              cartState.removeFromCart();
                              Navigator.pop(ctx);
                            },
                          ),
                        ],
                        kSpaceH(5.5),
                      ],
                    ),
                  ),
                  //add to cart confirmation button
                  CartItemConfirm(
                    cartItem: cartItem,
                  )
                ],
              ),
            ),
          ),
        );
      });
}

import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/modals/cart-product-modal/cart-item-modal.dart';
import 'package:fashion/utils/add-to-cart-toast.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
    required this.cartState,
    required this.cartItem,
  }) : super(key: key);

  final CartProvider cartState;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        cartState.setTempCartItem(cartItem);

        final result = await showCartItem(context, preview: true);
        if (result == true) addToCartAlert(context, cartItem.product.title!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  cartItem.product.image!,
                ),
              ),
            ),
            kSpaceW(1),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "${cartItem.quantity}",
                          style: kCaption(
                            context,
                            Colors.white,
                          )?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      kSpaceW(1),
                      Text("${cartItem.product.title}"),
                    ],
                  ),
                  kSpaceH(1),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    children: cartItem.product
                        .getSelectedOptions()
                        .map((e) => Text("$e"))
                        .toList(),
                  )
                ],
              ),
            ),
            kSpaceW(1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.arrow_forward, size: 18),
                kSpaceH(0.25),
                Text(
                  "$kCurrency${cartItem.total}",
                  style: kSubtitle1(context)
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

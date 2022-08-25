import 'package:fashion/providers/cart-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//cart icon with item count badge
class CartIcon extends StatelessWidget {
  final Color color;
  const CartIcon({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (ctx, cartState, child) => Row(
        children: [
          Image.asset(
            "assets/icons/sac-de-courses.png",
            width: 15,
            color: color,
          ),
          //const Icon(Icons.shopping_basket_outlined),
          if (cartState.cartLength > 0)
            Container(
              width: 15,
              height: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                //Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "${cartState.cartLength}",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

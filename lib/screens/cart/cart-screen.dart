import 'package:fashion/configs/app-config.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/styles/button-style.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:fashion/widgets/navigation/main-bottombar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/cart/widgets/cart-list-item.dart';
import 'package:fashion/screens/category/category-screen.dart';
import 'package:fashion/screens/order/order-screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: true);

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Cart",
        showBackButton: false,
        icon: Image.asset(
          "assets/icons/sac-de-courses.png",
          width: 20,
          color: Colors.grey.shade400,
        ),
        // Icon(
        //   Icons.shopping_basket_outlined,
        //   color: Colors.grey.shade400,
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: kBodyPadding,
              itemCount: cartState.cart.cartItems.length,
              itemBuilder: (ctx, index) {
                final cartItem = cartState.cart.cartItems[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //cart list item
                    CartListItem(cartState: cartState, cartItem: cartItem),
                    const Divider()
                  ],
                );
              },
            ),
          ),
          //bottom action, order  button and cart total amount
          Padding(
            padding: kBodyPadding,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    cartState.cart.cartItems.isNotEmpty
                        ? "Total - $kCurrency${cartState.cart.total.toStringAsFixed(2)}"
                        : "*Cart is empty",
                    style: kHeadline5(context),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: kBlackButtonStyle,
                    onPressed: () {
                      if (cartState.cart.cartItems.isEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrderScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      cartState.cart.cartItems.isNotEmpty
                          ? "Order"
                          : "Browse Clothes",
                      style: kHeadline6(context, Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const MainBottomBar(
        currentIndex: 2,
      ),
    );
  }
}

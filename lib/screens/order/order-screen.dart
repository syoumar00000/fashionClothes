import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/order.dart';
import 'package:fashion/providers/address-provider.dart';
import 'package:fashion/providers/cart-provider.dart';
import 'package:fashion/providers/order-provider.dart';
import 'package:fashion/providers/payment-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/full-black-button.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/modals/address-picker-modal/address-picker-modal.dart';
import 'package:fashion/screens/order/order-details-screen.dart';
import 'package:fashion/screens/order/widgets/order-cart-line.dart';
import 'package:fashion/screens/order/widgets/order-payment-line.dart';
import 'package:fashion/screens/order/widgets/order-row.dart';
import 'package:fashion/screens/order/widgets/order-summary.dart';
import 'package:fashion/screens/success/success-screen.dart';
import 'package:fashion/widgets/input/no-border-input.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final cartState = Provider.of<CartProvider>(context, listen: false);
    final addressState = Provider.of<AddressProvider>(context, listen: false);
    final paymentState = Provider.of<PaymentProvider>(context, listen: false);
    final orderState = Provider.of<OrderProvider>(context, listen: false);

    final Order newOrder = Order(
      id: "56476",
      total: cartState.cart.total * 1.18 + 2,
      tax: cartState.cart.total * 0.18,
      deliveryCost: 2,
      discount: 0,
      cartItems: [...cartState.cart.cartItems],
      status: OrderStatus.confirmed,
      estimatedTime: DateTime.now().add(
        const Duration(minutes: 60),
      ),
    );

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Order ",
        showBackButton: true,
        icon: Icon(
          Icons.shopping_basket_outlined,
          color: Colors.grey.shade400,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: kBodyPadding.copyWith(top: 4),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  OrderCartLine(cart: cartState.cart),
                  kSpaceH(0.5),
                  const Divider(),
                  //addres row
                  OrderRow(
                    title: "Delivery Address",
                    actionTitle: "change",
                    action: () {
                      showAddressPicker(context);
                    },
                    child: Text(
                      addressState.selectedAddress?.formattedAddress ?? "",
                      style: kSubtitle1(context),
                    ),
                  ),
                  kSpaceH(0.5),
                  const Divider(),
                  OrderPaymentLine(paymentState: paymentState),
                  kSpaceH(0.5),
                  const Divider(),
                  //order coupon line
                  OrderRow(
                      title: "Enter coupon",
                      actionTitle: "check",
                      action: () {},
                      child: const SizedBox(
                        height: 20,
                        child: NoBorderInput(
                          padding: EdgeInsets.zero,
                          hint: "enter your coupon code",
                        ),
                      )),
                  kSpaceH(1.5),
                  const Divider(),
                  kSpaceH(1),
                  OrderSummary(
                    cart: cartState.cart,
                  )
                ],
              ),
            ),
            kSpaceH(2),
            //place order button
            SizedBox(
              width: double.infinity,
              child: FullBlackButton(
                width: double.infinity,
                onPressed: () {
                  cartState.clear();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                        buttonTitle: "Track your Order - 30 min",
                        title: "Order Ticket #74893",
                        description:
                            "Thank you for using Food Ordering App, your order estimated time is 30 min. Feel free to contact us for futher informations.",
                        onPressed: () {
                          orderState.selectOrder(newOrder);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => OrderDetailsScreen(
                                order: newOrder,
                              ),
                            ),
                          );
                          //OrderTrackingScreen();
                        },
                      ),
                    ),
                  );
                },
                label:
                    "Place Order - $kCurrency${newOrder.total.toStringAsFixed(2)}",
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:fashion/models/order.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/order/widgets/order-summary.dart';
import 'package:fashion/screens/order/widgets/order-tracking.dart';
import 'package:fashion/screens/order/widgets/product-line.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Order #${widget.order.id}",
      ),
      body: SingleChildScrollView(
        padding: kBodyPadding,
        child: Column(
          children: [
            //order product quantity and prices
            Container(
              constraints: BoxConstraints(
                minHeight: kScreenHeight(context) / 2.5,
              ),
              child: Column(
                children: widget.order.cartItems
                    .map(
                      (e) => ProductLine(item: e),
                    )
                    .toList(),
              ),
            ),
            Divider(),
            kSpaceH(1),
            //order status and track order button
            OrderTracking(order: widget.order),
            kSpaceH(1),
            Divider(),
            kSpaceH(1),
            //order summary total, tax, discount
            OrderSummary(
              order: widget.order,
            )
          ],
        ),
      ),
    );
  }
}

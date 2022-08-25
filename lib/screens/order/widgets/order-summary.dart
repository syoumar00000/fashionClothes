import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/models/order.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final Order? order;
  final Cart? cart;

  const OrderSummary({
    Key? key,
    this.cart,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //get subtotal based on order details or order confirmation
    final String subtotal =
        order == null ? cart!.totalString : order!.subTotal.toStringAsFixed(2);

    //get delivery cost based on order details or order confirmation
    final String deliveryCost =
        order == null ? "2" : order!.deliveryCost.toString();

    //get discount based on order details or order confirmation
    final String discount =
        order == null ? "0" : order!.discount.toStringAsFixed(2);

    //get tax based on order details or order confirmation
    final String tax = order == null
        ? (cart!.total * 0.18).toStringAsFixed(2)
        : order!.tax.toStringAsFixed(2);

    //get total based on order details or order confirmation
    final String total = order == null
        ? (cart!.total * 1.18 + 2).toStringAsFixed(2)
        : order!.total.toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Summary", style: kHeadline6(context)),
        kSpaceH(1.5),
        OrderSummaryRow(
          title: "Subtotal",
          content: "$kCurrency$subtotal",
        ),
        kSpaceH(1),
        OrderSummaryRow(
          title: "Discount",
          content: "-$kCurrency$discount",
        ),
        kSpaceH(1),
        OrderSummaryRow(
          title: "Delivery cost",
          content: "$kCurrency$deliveryCost",
        ),
        kSpaceH(1),
        OrderSummaryRow(
          title: "Tax",
          content: "$kCurrency$tax",
        ),
        kSpaceH(1),
        OrderSummaryRow(
          title: "Total",
          content: "$kCurrency$total",
        ),
      ],
    );
  }
}

class OrderSummaryRow extends StatelessWidget {
  final String title;
  final String content;

  const OrderSummaryRow({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: title == "Total"
              ? kSubtitle1(context)?.copyWith(fontWeight: FontWeight.bold)
              : kSubtitle1(context),
        ),
        Text(
          content,
          style: title == "Total"
              ? kHeadline6(context)?.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                )
              : kSubtitle1(context),
        ),
      ],
    );
  }
}

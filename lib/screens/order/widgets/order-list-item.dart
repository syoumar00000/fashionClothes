import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/order.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  const OrderListItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              //order products count
              Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  order.cartItems.map((e) => null).length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              kSpaceW(1),
              Text(
                "Products",
                style: kHeadline6(context),
              ),
              const Spacer(),
              //order total price
              Text(
                "$kCurrency ${(order.total + order.tax).toStringAsFixed(2)}",
                style:
                    kHeadline6(context)?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          //
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(left: 30, right: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //order product list
                  child: Wrap(
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    runSpacing: 10,
                    spacing: 10,
                    children: order.cartItems
                        .map(
                          (e) => Text(
                            "${e.quantity}x ${e.product.title},",
                            style: kSubtitle1(context),
                          ),
                        )
                        .toList(),
                  ),
                ),
                kSpaceW(1),
                //order status
                Container(
                  decoration: BoxDecoration(
                    color: getStatusColor(order.status),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 70,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    //substring for removing OrderStatus. in text
                    order.statusString,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

//get order status colors
Color getStatusColor(OrderStatus status) {
  switch (status) {
    case OrderStatus.confirmed:
      return Colors.blue;
    case OrderStatus.processed:
      return Colors.cyan;
    case OrderStatus.picking:
      return Colors.orange;
    case OrderStatus.delivered:
      return Colors.green;
    default:
      return Colors.blue;
  }
}

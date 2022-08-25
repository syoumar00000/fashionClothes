import 'package:fashion/providers/order-provider.dart';
import 'package:fashion/screens/order/order-details-screen.dart';
import 'package:fashion/screens/order/widgets/order-list-item.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//user account order list screen
class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    final orderState = Provider.of<OrderProvider>(context, listen: true);
    final orders = orderState.items;

    return Scaffold(
      appBar: DefaultAppBar(
        title: "My Orders ",
        icon: Icon(
          Icons.list_alt,
          color: Colors.grey.shade200,
        ),
      ),
      body: ListView.builder(
        padding: kBodyPadding,
        itemCount: orders.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              //navigate to order details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => OrderDetailsScreen(
                    order: orders[index],
                  ),
                ),
              );
            },
            child: OrderListItem(
              order: orders[index],
            ),
          );
        },
      ),
    );
  }
}

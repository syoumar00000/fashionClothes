import 'package:fashion/models/order.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/order/widgets/order-list-item.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:timeline_tile/timeline_tile.dart';

//order tracking time line
class OrderTracking extends StatelessWidget {
  final Order order;
  const OrderTracking({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrderTimeLine(
            status: order.status,
            defaultStatus: OrderStatus.confirmed,
            icon: Icons.check_circle_outline,
            index: 0,
            title: "Confirmed",
            duration: 0,
          ),
          OrderTimeLine(
            status: order.status,
            defaultStatus: OrderStatus.processed,
            icon: Icons.outdoor_grill_outlined,
            index: 1,
            title: "Processed",
            duration: 30,
          ),
          OrderTimeLine(
            status: order.status,
            defaultStatus: OrderStatus.picking,
            icon: Icons.delivery_dining_outlined,
            index: 2,
            title: "Picking",
            duration: 15,
          ),
          OrderTimeLine(
            status: order.status,
            defaultStatus: OrderStatus.delivered,
            index: 3,
            title: "Delivery",
            icon: Icons.inventory_2_outlined,
            duration: 25,
          )
        ],
      ),
    );
  }
}

//Order horizontal timeline
class OrderTimeLine extends StatelessWidget {
  final OrderStatus status;
  //time line default status
  final OrderStatus defaultStatus;
  //time line index
  final int index;
  final String title;
  final int duration;
  final IconData icon;

  const OrderTimeLine({
    Key? key,
    required this.status,
    required this.index,
    required this.title,
    required this.duration,
    required this.icon,
    required this.defaultStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      startChild: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(title),
          ],
        ),
      ),
      endChild: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minWidth: kScreenWitdh(context) / 4 - 10,
          maxWidth: kScreenWitdh(context) / 4 - 10,
        ),
        child: Text(
          "$duration min",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      indicatorStyle: IndicatorStyle(
        width: 35,
        height: 35,
        color:
            status.index >= index ? getStatusColor(defaultStatus) : Colors.grey,
        iconStyle: IconStyle(
          iconData: icon,
          color: Colors.white,
        ),
      ),
      //time line before progression
      beforeLineStyle: LineStyle(
        color: status.index >= index ? Colors.orange : Colors.grey,
        thickness: 2,
      ),
      //time line after progression
      afterLineStyle: LineStyle(
        color: status.index >= index ? Colors.orange : Colors.grey,
        thickness: 2,
      ),
    );
  }
}

import 'package:fashion/models/notification.dart';

final List<Notification> notificationMockup = [
  Notification(
    title: "Order delivered",
    read: false,
    date: DateTime(2021, 8, 5),
    type: "success",
    content: "Your order has been  #364785 delivered.",
  ),
  Notification(
    title: "Order placed",
    read: true,
    date: DateTime(2021, 8, 4),
    type: "",
    content:
        "Your meal order #75677 has been successfully placed, you can track your order know.",
  ),
  Notification(
    title: "Order placed",
    read: true,
    date: DateTime(2021, 8, 4),
    type: "",
    content:
        "Your meal order #36785 has been successfully placed, you can track your order know.",
  ),
  Notification(
    title: "Discount",
    read: false,
    date: DateTime(2021, 8, 4),
    type: "",
    content: "Place your first order and earn 50% off, offer valid today.",
  ),
  Notification(
    title: "Delivery",
    read: true,
    date: DateTime(2021, 8, 3),
    type: "success",
    content: "The delivery man is on his way to you.",
  ),
  Notification(
    title: "Account update",
    read: true,
    date: DateTime(2021, 8, 3),
    type: "",
    content: "You updated your account information.",
  ),
  Notification(
    title: "Order placed",
    read: true,
    date: DateTime(2021, 8, 3),
    type: "",
    content:
        "Your meal order #364785 has been successfully placed, you can track your order know.",
  ),
  Notification(
    title: "Order placed",
    read: true,
    date: DateTime(2021, 8, 3),
    type: "",
    content:
        "Your meal order #364785 has been successfully placed, you can track your order know.",
  ),
  Notification(
    title: "Order rejected",
    read: true,
    type: "warning",
    date: DateTime(2021, 8, 2),
    content:
        "Your meal order #364785 has been rejected for unsupported address, please contact support for more information.",
  ),
  Notification(
    title: "You're welcome",
    read: true,
    type: "",
    date: DateTime(2021, 7, 1),
    content: "Welcome to Food ordering find your favorite meal.",
  ),
];

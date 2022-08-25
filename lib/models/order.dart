import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/cart.dart';
import 'package:intl/intl.dart';

class Order {
  String id;
  double total;
  double tax;
  double discount;
  OrderStatus status;
  List<CartItem> cartItems;
  DateTime estimatedTime;
  double deliveryCost;

  String get totalString => "$kCurrency${total.toStringAsFixed(2)}";
  String get statusString =>
      toBeginningOfSentenceCase(status.toString().substring(12))!;
  double get subTotal => total - tax + discount - deliveryCost;

  Order({
    required this.total,
    required this.cartItems,
    required this.status,
    required this.estimatedTime,
    required this.tax,
    required this.discount,
    required this.deliveryCost,
    required this.id,
  });
}

enum OrderStatus {
  confirmed,
  processed,
  picking,
  delivered,
}

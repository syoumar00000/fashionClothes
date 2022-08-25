import 'package:fashion/models/product.dart';

class Cart {
  double total;
  List<CartItem> cartItems;
  String get totalString => total.toStringAsFixed(2);

  Cart({required this.total, required this.cartItems});
}

class CartItem {
  Product product;
  List<String>? options;
  PriceItem selectedPrice;
  int quantity;

  CartItem(
      {required this.product,
      this.options,
      required this.selectedPrice,
      required this.quantity});

  double get total => selectedPrice.amount * quantity.toDouble();
}

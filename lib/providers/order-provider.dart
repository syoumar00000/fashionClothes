import 'dart:collection';
import 'package:fashion/mockups/orders-mockup.dart';
import 'package:fashion/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  late Order _currentItem;
  List<Order> _items = [];

  UnmodifiableListView<Order> get items => UnmodifiableListView(_items);
  Order get currentItem => _currentItem;

  selectOrder(Order order) {
    _currentItem = order;
    notifyListeners();
  }

  getAll() {
    _items.addAll(orderMockup);
    notifyListeners();
  }
}

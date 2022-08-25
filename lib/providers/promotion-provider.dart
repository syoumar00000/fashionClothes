import 'dart:collection';
import 'package:fashion/mockups/promotion-mockup.dart';
import 'package:fashion/models/promotion.dart';
import 'package:flutter/material.dart';

class PromotionProvider extends ChangeNotifier {
  List<Promotion> _items = [];

  UnmodifiableListView<Promotion> get items => UnmodifiableListView(_items);

  //get promotionnal items
  getAll() async {
    _items = promotionMockup;
    notifyListeners();
    return _items;
  }
}

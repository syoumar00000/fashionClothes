import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:fashion/models/product.dart';
import 'package:flutter/material.dart';
import 'package:fashion/mockups/products-mockup.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _items = [
    productMockup[0],
    productMockup[10],
    productMockup[5],
    productMockup[27],
    productMockup[27],
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  bool isFavorite(Product element) => items.contains(element);

  //get promotionnal items
  toggle(Product product) {
    //check if product exist in favoris
    final index = _items.firstWhereOrNull(
      (element) => element.id == product.id,
    );

    //add if not exists
    if (index == null)
      _items.add(product);
    else
      //else remove
      _items.remove(product);

    notifyListeners();
  }
}

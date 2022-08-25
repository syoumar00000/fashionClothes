import 'dart:collection';
import 'package:fashion/mockups/categories-mockup.dart';
import 'package:fashion/models/category.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];
  UnmodifiableListView<Category> get items => UnmodifiableListView(_items);

  //get all categories
  getAll() async {
    _items = categoryMockup;
    notifyListeners();
    return _items;
  }
}

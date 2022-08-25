import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:fashion/mockups/categories-mockup.dart';
import 'package:fashion/mockups/products-mockup.dart';
import 'package:fashion/models/category.dart';
import 'package:fashion/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> _filteredItems = [];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  UnmodifiableListView<Product> get filteredItems =>
      UnmodifiableListView(_filteredItems);

  //get by categories
  getByCategory(Category category) {
    _filteredItems.clear();
    _filteredItems.addAll([
      ..._items.where((element) => element.category!.id == category.id).toList()
    ]);
    notifyListeners();
  }

  //filter products
  filterProducts({
    required List<int> categoryIds,
    required List<double> priceRange,
    required List<double> cookDurationRange,
    required List<double> caloryRange,
    required List<int> categoryIdRange,
  }) {
    List<Product> results = [];

    if (categoryIds.isNotEmpty) {
      results = [
        ..._items
            .where(
                (element) => categoryIds.indexOf(element.category!.id!) != -1)
            .toList()
      ];
    } else {
      results = [
        ..._items,
      ];
    }
    if (categoryIdRange.isNotEmpty) {
      results = [
        ..._items
            .where((element) =>
                categoryIdRange.indexOf(element.category!.id!) != -1)
            .toList()
      ];
    } else {
      results = [
        ..._items,
      ];
    }

    //filter based on price, calory and cook duration range
    results = results
        .where(
          (element) =>
              element.prices![0].amount > priceRange[0] &&
              element.prices![0].amount < priceRange[1],
        )
        .toList()
        .where(
          (element) =>
              element.calories! > caloryRange[0] &&
              element.calories! < caloryRange[1],
        )
        .toList()
        .where(
          (element) =>
              element.cookDuration! > cookDurationRange[0] &&
              element.cookDuration! < cookDurationRange[1],
        )
        .toList();

    _filteredItems.clear();
    _filteredItems.addAll(results);
    notifyListeners();
  }

  //get by categories
  searchProduct(String searchValue) {
    _filteredItems.clear();
    _filteredItems.addAll([
      ..._items
          .where((element) =>
              element.title!.toLowerCase().indexOf(searchValue.toLowerCase()) !=
              -1)
          .toList()
    ]);
    notifyListeners();
  }

  //get all Product items
  getAll() async {
    _items = productMockup.map((product) {
      //get product category from static category mockup data
      product.category = categoryMockup
          .firstWhere((category) => category.id == product.category!.id);
      return product;
    }).toList();
    notifyListeners();
  }
}

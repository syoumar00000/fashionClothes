import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/category.dart';

class Product {
  int? id;
  String? title;
  String? description;
  int? cookDuration;
  int? calories;
  Category? category;
  double? discount;
  String? image;
  List<SizeItem>? size;
  bool? featured;
  List<PriceItem>? prices;
  List<OptionItem>? options;
  int? favoriteCount;
  int? orderCount;
  double? rate;

  Product({
    this.id,
    this.title,
    this.description,
    this.cookDuration,
    this.calories,
    this.category,
    this.discount,
    this.prices,
    this.options,
    this.image,
    this.featured,
    this.favoriteCount,
    this.orderCount,
    this.rate,
    this.size,
  });

  price(PriceItem price) {
    return price.amount * (1 - this.discount!);
  }

  discountPercent() {
    return this.discount! * 100;
  }

  priceString(PriceItem price) {
    return "$kCurrency${(price.amount * 1 - this.discount!).toStringAsFixed(2)}";
  }

  List<String> getSelectedOptions() {
    return options!
        .map((e) => e.selected)
        .expand<String>((element) => element as dynamic)
        .toList();
  }
}

class PriceItem {
  final String title;
  final double amount;

  PriceItem(this.title, this.amount);
}

class OptionItem {
  final bool multiple;
  final String title;
  final List<String> values;
  List<String>? selected = [];

  OptionItem(this.title, this.values, this.multiple) {
    if (multiple == false) selected = [""];
  }
}

class SizeItem {
  final String label;
  SizeItem(this.label);
}

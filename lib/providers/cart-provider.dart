import 'package:flutter/material.dart';
import 'package:fashion/models/cart.dart';
import 'package:fashion/models/product.dart';
import 'package:collection/collection.dart';

class CartProvider extends ChangeNotifier {
  Cart _cart = Cart(total: 0, cartItems: []);
  CartItem? _tempCartItem;
  //last cart items states before update
  CartItem? _currentCartItem;
  bool _loading = false;

  Cart get cart => _cart;
  int get cartLength => _cart.cartItems.length;

  CartItem? get tempCartItem => _tempCartItem;

  bool get loading => _loading;

  setTempCartItem(CartItem item) {
    _tempCartItem = item;
    _currentCartItem = item;
    notifyListeners();
  }

  //update customer selected price option
  selectPrice(PriceItem price) {
    _tempCartItem!.selectedPrice = price;

    notifyListeners();
  }

  //update customer selected options
  setOption(OptionItem option, String value, [bool checked = false]) {
    if (option.multiple == false)
      option.selected![0] = value;
    else if (option.multiple == true && checked)
      option.selected!.add(value);
    else if (option.multiple == true && !checked)
      option.selected!.remove(value);

    notifyListeners();
  }

  //increment cart item quantity
  increment(int value) {
    if ((_tempCartItem!.quantity + value) > 0) _tempCartItem!.quantity += value;
    notifyListeners();
  }

//add to cart
  addToCart(CartItem item) {
    final _results = _cart.cartItems.indexWhere(
      (element) => element.product.id == item.product.id,
    );

    //add if not exists
    if (_results == -1)
      _cart.cartItems.add(item);
    //update if exits
    else
      _cart.cartItems[_results] = item;

    //update cart total amount
    _cart.total = _cart.cartItems
        .map((e) => e.selectedPrice.amount * e.quantity)
        .reduce((value, element) => value + element);
    notifyListeners();
  }

  //remove from cart with currentCartItem
  removeFromCart() {
    //update cart total amount
    _cart.total = _cart.cartItems
        .map((e) => e.selectedPrice.amount * e.quantity)
        .reduce((value, element) => value + element);

    _cart.cartItems.remove(_currentCartItem);

    notifyListeners();
  }

//find cart Item
  findCartItem(Product product) {
    final _results = _cart.cartItems.firstWhereOrNull(
      (element) => element.product.id == product.id,
    );
    if (_results != null) {
      _tempCartItem = _results;
      _currentCartItem = _results;
    }

    return _results;
  }

  //clear cart
  clear() {
    _cart.cartItems.clear();
    _cart.total = 0;
    notifyListeners();
  }
}

import 'package:fashion/models/customer.dart';
import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  final Customer _customer = Customer();

  get() {
    _customer.email = "jpocknoll0@bbc.co.uk";
    _customer.firstname = "James";
    _customer.lastname = "Pocknoll";
    _customer.password = "";
    _customer.phoneNumber = "2734268197";
    _customer.photo = null;

    notifyListeners();
  }
}

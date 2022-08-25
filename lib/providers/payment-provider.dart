import 'dart:collection';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:fashion/models/payment-card.dart';
import 'package:flutter/material.dart';
import 'package:fashion/models/payment-method.dart';

class PaymentProvider extends ChangeNotifier {
  List<PaymentCard> _cards = [
    PaymentCard(
        type: CreditCardType.visa,
        number: "xxxx xxxx xxxx 5469",
        name: "Linzy Alonso",
        month: 5,
        year: 22,
        cvv: 928),
    PaymentCard(
        type: CreditCardType.visa,
        number: "xxxx xxxx xxxx 1876",
        name: "Constanta Bravery",
        month: 10,
        year: 22,
        cvv: 359),
    PaymentCard(
        type: CreditCardType.mastercard,
        number: "xxxx xxxx xxxx 0763",
        name: "Eugenio Sandaver",
        month: 2,
        year: 23,
        cvv: 764)
  ];

  List<PaymentMethod> _paymentMethods = [];
  PaymentMethod? _selectedPaymentMethod;

  UnmodifiableListView<PaymentCard> get cards => UnmodifiableListView(_cards);
  UnmodifiableListView<PaymentMethod> get paymentMethods =>
      UnmodifiableListView(_paymentMethods);
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  getAllCards() {
    notifyListeners();
  }

  //select or change current payment method
  selectAddress(PaymentMethod paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  getAllPaymentMethod() {
    _paymentMethods.addAll([
      PaymentMethod(type: PaymentMethodType.creditCard, creditCard: _cards[0]),
      PaymentMethod(type: PaymentMethodType.creditCard, creditCard: _cards[1]),
      PaymentMethod(type: PaymentMethodType.creditCard, creditCard: _cards[2]),
      PaymentMethod(
        type: PaymentMethodType.paypal,
        paypalAccount: "obims0@rambler.ru",
      ),
    ]);
    _selectedPaymentMethod = _paymentMethods[1];
    notifyListeners();
  }
}

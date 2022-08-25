import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';

class PaymentCard {
  CreditCardType type;
  String number;
  String name;
  int month;
  int year;
  int cvv;

  PaymentCard({
    required this.type,
    required this.number,
    required this.name,
    required this.month,
    required this.year,
    required this.cvv,
  });

//detect credit cart icon you can add your own such as american express, amex etc
  Widget getCardIcon(double size) {
    Widget icon;
    switch (type) {
      case CreditCardType.mastercard:
        icon = SvgPicture.asset(
          "assets/icons/mastercard.svg",
          width: size,
        );
        break;
      case CreditCardType.visa:
        icon = SvgPicture.asset(
          "assets/icons/visa.svg",
          width: size,
        );
        break;
      default:
        icon = Icon(
          Icons.warning,
          size: 40.0,
          color: Colors.grey[600],
        );
        break;
    }

    return icon;
  }
}

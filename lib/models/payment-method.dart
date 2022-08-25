import 'package:fashion/models/payment-card.dart';

class PaymentMethod {
  final PaymentMethodType type;
  final String? paypalAccount;
  final PaymentCard? creditCard;

  PaymentMethod({
    required this.type,
    this.paypalAccount,
    this.creditCard,
  });
}

enum PaymentMethodType { paypal, creditCard }

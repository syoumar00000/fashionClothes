import 'package:fashion/models/payment-method.dart';
import 'package:fashion/providers/payment-provider.dart';
import 'package:fashion/screens/order/widgets/order-row.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/modals/payment-picker-modal/payment-picker-modal.dart';
import 'package:ionicons/ionicons.dart';

class OrderPaymentLine extends StatelessWidget {
  const OrderPaymentLine({
    Key? key,
    required this.paymentState,
  }) : super(key: key);

  final PaymentProvider paymentState;

  @override
  Widget build(BuildContext context) {
    return OrderRow(
      title: "Payment Method",
      actionTitle: "change",
      action: () {
        showPaymentMethodPicker(context);
      },
      child: Row(
        children: [
          paymentState.selectedPaymentMethod?.type ==
                  PaymentMethodType.creditCard
              ? paymentState.selectedPaymentMethod!.creditCard!.getCardIcon(28)
              : Icon(
                  Ionicons.logo_paypal,
                  color: Colors.blue.shade900,
                ),
          kSpaceW(1.5),
          Text(
            paymentState.selectedPaymentMethod?.type ==
                    PaymentMethodType.creditCard
                ? paymentState.selectedPaymentMethod!.creditCard!.number
                : paymentState.selectedPaymentMethod!.paypalAccount!,
            style: kSubtitle1(context),
          )
        ],
      ),
    );
  }
}

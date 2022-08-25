import 'package:fashion/models/payment-method.dart';
import 'package:fashion/providers/payment-provider.dart';
import 'package:fashion/screens/credit-card/credit-card-form-screen.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/full-black-button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

//payment select bottom sheet
Future<bool?> showPaymentMethodPicker(
  BuildContext context, {
  bool preview = true,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      final paymentState = Provider.of<PaymentProvider>(context, listen: true);
      PaymentMethod? selectedPaymentMethod = paymentState.selectedPaymentMethod;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => SafeArea(
          child: Container(
            constraints:
                BoxConstraints(maxHeight: kScreenHeight(context) - 100),
            padding: kBodyPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Methods",
                            style: kHeadline6(context),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreditCardFormScreen()));
                              },
                              child: Text(
                                "Add new",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      kSpaceH(2),
                      //payment method to select radio list
                      ...paymentState.paymentMethods
                          .map(
                            (e) => RadioListTile<PaymentMethod>(
                              title: Row(
                                children: [
                                  e.type == PaymentMethodType.creditCard
                                      ? e.creditCard!.getCardIcon(28)
                                      : Icon(Ionicons.logo_paypal),
                                  kSpaceW(1.5),
                                  Text(
                                    e.type == PaymentMethodType.creditCard
                                        ? e.creditCard!.number
                                        : e.paypalAccount!,
                                    style: kSubtitle1(context),
                                  )
                                ],
                              ),
                              value: e,
                              groupValue: selectedPaymentMethod,
                              onChanged: (selected) {
                                setState(() {
                                  selectedPaymentMethod = e;
                                });
                              },
                            ),
                          )
                          .toList(),
                      kSpaceH(7),
                    ],
                  ),
                ),
                //select payment method confirmation button
                selectedPaymentMethod != null
                    ? Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: kScreenWitdh(context) - 25,
                          child: FullBlackButton(
                            width: double.infinity,
                            onPressed: () {
                              paymentState
                                  .selectAddress(selectedPaymentMethod!);
                              Navigator.pop(context);
                            },
                            label: "Select payment method",
                          ),
                        ),
                      )
                    : Container(
                        height: 0,
                      ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

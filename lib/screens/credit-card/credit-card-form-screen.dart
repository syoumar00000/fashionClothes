import 'package:flutter/material.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/input/full-black-button.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardFormScreen extends StatefulWidget {
  const CreditCardFormScreen({Key? key}) : super(key: key);

  @override
  _CreditCardFormScreenState createState() => _CreditCardFormScreenState();
}

class _CreditCardFormScreenState extends State<CreditCardFormScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Add credit cart",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //fake credit card widget
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              textStyle: GoogleFonts.sourceSansPro().copyWith(
                  fontSize: 18,
                  color: isCvvFocused ? Colors.black : Colors.white),
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
            //new credit card form
            //flutter credit card plugin
            CreditCardForm(
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: Colors.blue,
              cardHolderDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder Name',
              ),
              cardNumberDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              onCreditCardModelChange: onCreditCardModelChange,
            ),
            kSpaceH(3),
            //validate button
            Padding(
              padding: kBodyPadding,
              child: FullBlackButton(
                width: double.infinity,
                label: "Save and continue",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/credit-card-list");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

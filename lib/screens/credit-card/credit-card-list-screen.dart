import 'package:fashion/providers/payment-provider.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditCardListScreen extends StatelessWidget {
  const CreditCardListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creditCardState = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Credit cards",
      ),
      body: ListView.builder(
          itemCount: creditCardState.cards.length,
          itemBuilder: (ctx, index) {
            final card = creditCardState.cards[index];

            //address list item
            return Padding(
              padding: kBodyPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  card.getCardIcon(35),
                  kSpaceW(1.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.name,
                        style: kSubtitle1(context)
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      kSpaceH(0.75),
                      Text(card.number, style: kSubtitle1(context))
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete_outlined),
                    iconSize: 22,
                    onPressed: () {},
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, "/credit-card-form");
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

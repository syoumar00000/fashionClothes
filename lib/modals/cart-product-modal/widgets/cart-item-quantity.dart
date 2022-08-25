import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';

//cart item quantity management
class CartItemQuantity extends StatelessWidget {
  final String quantity;
  final Function(int value) onIncrement;

  const CartItemQuantity({
    Key? key,
    required this.quantity,
    required this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: CircleBorder(),
                elevation: 0,
                primary: Colors.grey.shade300),
            child: Icon(
              Icons.remove,
              size: 25,
            ),
            onPressed: () => onIncrement(-1),
          ),
        ),
        kSpaceW(1.25),
        Text(
          "$quantity",
          style: Theme.of(context).textTheme.headline6,
        ),
        kSpaceW(1.25),
        Container(
          width: 50,
          height: 50,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: CircleBorder(),
              elevation: 0,
              primary: Colors.grey.shade300,
            ),
            child: Icon(
              Icons.add,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () => onIncrement(1),
          ),
        ),
      ],
    );
  }
}

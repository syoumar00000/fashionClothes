import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';

//product details energy, cook duration etc
class ProductDetailsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProductDetailsItem(
      {Key? key, required this.icon, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          kSpaceW(0.5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          Text(value),
        ],
      ),
    );
  }
}

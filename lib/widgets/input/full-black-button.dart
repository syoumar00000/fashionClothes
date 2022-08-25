import 'package:fashion/styles/button-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class FullBlackButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Function() onPressed;
  final String label;

  const FullBlackButton({
    Key? key,
    this.width,
    this.height,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: kBlackButtonStyle,
        child: Text(
          label,
          style: kSubtitle1(context, Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

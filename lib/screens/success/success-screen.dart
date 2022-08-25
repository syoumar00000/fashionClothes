import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String buttonTitle;
  final String title;
  final String description;
  final Function() onPressed;

  const SuccessScreen({
    Key? key,
    required this.buttonTitle,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.infinity,
        padding: kBodyPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: kHeadline5(context)
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            kSpaceH(4),
            Image.asset(
              "assets/images/misc/checked.png",
              width: 100,
            ),
            kSpaceH(4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: kSubtitle1(context)?.copyWith(color: Colors.white),
            ),
            kSpaceH(8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, elevation: 0),
                child: Text(
                  buttonTitle,
                  style: kSubtitle1(context),
                ),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fashion/screens/authentication/signin-screen.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
//import 'package:food_app/screens/authentication/signin-screen.dart';
//import 'package:food_app/screens/home/home-screen.dart';

//slide next and skip button in onboarding-b.screen.dart
class OnboardingActionButtons extends StatelessWidget {
  final int? slideIndex;
  final PageController? controller;

  const OnboardingActionButtons({
    Key? key,
    @required this.slideIndex,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (slideIndex! < 3)
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: () {
                controller!.animateToPage(
                  3,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text(
                "skip",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18),
              ),
            ),
          ),
        if (slideIndex! < 3)
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              width: 35,
              height: 35,
              margin: const EdgeInsets.only(right: 19),
              child: ElevatedButton(
                onPressed: () {
                  controller!.animateToPage(
                    slideIndex! + 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  primary: Colors.white,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // ),
                ),
                child: const Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: Colors.red,
                  size: 25,
                ),
              ),
            ),
          ),
        if (slideIndex == 3)
          Container(
            width: kScreenWitdh(context),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                //go to home page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              },
              child: const Text(
                "Get Started",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ),
      ],
    );
  }
}

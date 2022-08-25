import 'package:flutter/material.dart';

class OnboardingImageCard extends Card {
  OnboardingImageCard({
    required double height,
    required double width,
    required Color color,
    required String img,
    required VoidCallback onPressed,
  }) : super(
            child: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("$img"))),
          ),
        ));
}

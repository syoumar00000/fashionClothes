import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/input/circular-button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

//social sign buttons
class SocialSign extends StatelessWidget {
  const SocialSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularButton(
          size: 40,
          onPressed: () {},
          color: Colors.red,
          icon: const Icon(
            Ionicons.logo_google,
            size: 20,
            color: Colors.white,
          ),
        ),
        kSpaceW(1.25),
        CircularButton(
          size: 40,
          color: Colors.lightBlue,
          onPressed: () {},
          icon: const Icon(
            Ionicons.logo_twitter,
            size: 20,
            color: Colors.white,
          ),
        ),
        kSpaceW(1.25),
        CircularButton(
          size: 40,
          color: Colors.blue,
          onPressed: () {},
          icon: const Icon(
            Ionicons.logo_facebook,
            size: 20,
            color: Colors.white,
          ),
        ),
        kSpaceW(1.25),
        CircularButton(
          size: 40,
          onPressed: () {},
          icon: const Icon(
            Ionicons.logo_apple,
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

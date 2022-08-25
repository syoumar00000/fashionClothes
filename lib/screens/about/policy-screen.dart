import 'package:fashion/screens/about/widgets/about-bullets.dart';
import 'package:fashion/screens/about/widgets/about-title.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: "Policy",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kBodyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AboutTitle(header: "You can"),
              kSpaceH(1),
              const AboutBullets(contents: [
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
                " Quo quibusdam iste qui reiciendis enim aut ipsum facere",
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
                "lorem ipsum dolor sit amet",
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
              ]),
              kSpaceH(3),
              const AboutTitle(header: "You cannot"),
              kSpaceH(1),
              const AboutBullets(contents: [
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
                " Quo quibusdam iste qui reiciendis enim aut ipsum facere",
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
                "lorem ipsum dolor sit amet",
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
              ]),
              kSpaceH(3),
              const AboutTitle(header: "Others"),
              kSpaceH(1),
              const AboutBullets(contents: [
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
                " Quo quibusdam iste qui reiciendis enim aut ipsum facere",
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
                "lorem ipsum dolor sit amet",
                "Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem.",
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fashion/configs/app-config.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/about/widgets/about-bullets.dart';
import 'package:fashion/screens/about/widgets/about-content.dart';
import 'package:fashion/screens/about/widgets/about-title.dart';
import 'package:fashion/widgets/input/circular-button.dart';
import 'package:ionicons/ionicons.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "About",
        icon: Icon(
          Icons.info_outline,
          color: Colors.grey.shade400,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kBodyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/appicon.png",
                    width: 25,
                  ),
                  AboutContent(content: kAppTitle),
                  const Spacer(),
                  const AboutContent(content: "version x.x.x"),
                ],
              ),
              kSpaceH(2),
              AboutTitle(header: kAppTitle),
              kSpaceH(1),
              const AboutContent(
                  content:
                      "lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autemQui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere!"),
              kSpaceH(2),
              const AboutTitle(header: "Features"),
              kSpaceH(1),
              const AboutBullets(contents: [
                "More than 1000 uniques Clothes",
                "Buy clothes anytime you want",
                "Buy clothes anywhere you want"
                    "Express delivery",
                "Tracking in Real-Time",
                "24/7 Support"
              ]),
              kSpaceH(2),
              const AboutTitle(header: "A few reasons to use Our App"),
              kSpaceH(1),
              const AboutBullets(contents: [
                "Quality clothes",
                "Daily Discount",
                "Professionnal service",
                "Received at home",
                "24/7 Support"
              ]),
              kSpaceH(2),
              const AboutTitle(header: "About us"),
              kSpaceH(1),
              const AboutContent(
                content:
                    "MB Fashion is a score, lorem ipsum dolor sit amet. Qui minima inventore vel nisi laudantium ut accusantium beatae aut quas sint ab nulla beatae et dolor autem? Quo quibusdam iste qui reiciendis enim aut ipsum facere.",
              ),
              kSpaceH(2),
              const AboutTitle(header: "Contacts"),
              kSpaceH(1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("7450 Lotheville Drive"),
                    kSpaceH(0.75),
                    const Text("support@mbFashion.com"),
                    kSpaceH(0.75),
                    const Text("423-259-0773"),
                  ],
                ),
              ),
              kSpaceH(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularButton(
                    size: 40,
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
                      Ionicons.logo_instagram,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  kSpaceW(1.25),
                  CircularButton(
                    size: 40,
                    onPressed: () {},
                    icon: const Icon(
                      Ionicons.logo_pinterest,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

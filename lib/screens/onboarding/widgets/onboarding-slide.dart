import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';

//onboarding single slide widget and model
//used to display slide in onboarding-screen.dart file
// ! is for null check

class OnboardingSlide extends StatelessWidget {
  final int? id;
  final String? title;
  final String? description;
  final String? image;

  const OnboardingSlide(
      {Key? key, this.id, this.title, this.description, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kScreenWitdh2 = kScreenWitdh;
    return Stack(
      children: [
        //slide background image
        Container(
          width: kScreenWitdh2(context),
          height: kScreenHeight(context),
          padding: const EdgeInsets.only(top: 55),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                this.image!,
              ),
            ),
          ),
        ),
        //bottom gradient
        Positioned(
          bottom: 0,
          child: Container(
            height: kScreenHeight(context) / 2,
            width: kScreenWitdh(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(200, 8, 25, 43),
                  Color.fromARGB(0, 8, 25, 43),
                ],
              ),
            ),
          ),
        ),
        //title and description
        Padding(
          padding: kBodyPadding,
          //KNewPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                this.title ?? "",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.red,
                    ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                this.description ?? "",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.red, fontSize: 20),
              ),
              const SizedBox(
                height: 175,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget child;

  const AuthenticationLayout(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/misc/onb1.jpg"),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: kScreenHeight(context) - 200,
            width: kScreenWitdh(context),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kSpaceH(2),
                  Text(
                    title,
                    style: kHeadline6(context)?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kSpaceH(0.5),
                  Text(
                    subTitle,
                  ),
                  kSpaceH(3.5),
                  child,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

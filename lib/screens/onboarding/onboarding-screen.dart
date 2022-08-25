import 'package:fashion/screens/onboarding/widgets/onboarding-action-buttons.dart';
import 'package:fashion/screens/onboarding/widgets/onboarding-slide.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/indicator/slide-indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _slideIndex = 0;

  static const List<OnboardingSlide> _slides = [
    OnboardingSlide(
      id: 0,
      title: "Food Ordering",
      description:
          "Order your favorite foods in one click on Food Ordering App.",
      image: "assets/images/misc/onboarding1.png",
    ),
    OnboardingSlide(
      id: 1,
      title: "Best menu",
      description:
          "Find the best burgers, pizzas, spaghettis and much more on our app.",
      image: "assets/images/misc/onboarding2.png",
    ),
    OnboardingSlide(
      id: 2,
      title: "Fast Delivery",
      description:
          "We will deliver your order as quickly and efficiently as possible.",
      image: "assets/images/misc/onboarding3.png",
    ),
    OnboardingSlide(
      id: 3,
      title: "Fast Delivery",
      description:
          "We will deliver your order as quickly and efficiently as possible.",
      image: "assets/images/misc/onboarding4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //update status bar icon color to light
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            children: _slides,
            onPageChanged: (pageIndex) {
              setState(() {
                _slideIndex = pageIndex;
              });
            },
            controller: _controller,
          ),
          //next and skip buttons
          Positioned(
            width: kScreenWitdh(context),
            height: kScreenHeight(context) / 2,
            bottom: 15,
            left: 10,
            child: OnboardingActionButtons(
              slideIndex: _slideIndex,
              controller: _controller,
            ),
          ),
          //current page index indicator
          if (_slideIndex < 3)
            Positioned(
              bottom: 30,
              right: 0,
              width: kScreenWitdh(context) / 4,
              child: SlideIndicator(
                currentIndex: _slideIndex,
                itemCount: _slides.length,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:fashion/screens/authentication/signin-screen.dart';
import 'package:fashion/screens/onboarding/widgets/onboarding-image-card.dart';
import 'package:flutter/material.dart';

class MyOnboardingScreen extends StatelessWidget {
  const MyOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const Positioned(
            left: 30,
            top: 80,
            child: Text(
              "Each ",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          const Positioned(
            left: 70,
            top: 120,
            child: Text("Product is  ",
                style: TextStyle(color: Colors.black, fontSize: 30)),
          ),
          const Positioned(
            left: 180,
            top: 160,
            child: Text("Special ",
                style: TextStyle(color: Colors.black, fontSize: 30)),
          ),
          Positioned(
            left: 35,
            top: 170,
            child: Row(
              children: <Widget>[
                OnboardingImageCard(
                  height: 200,
                  width: 130,
                  color: Colors.grey,
                  img: "assets/images/items/r1.png",
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 10),
                  child: OnboardingImageCard(
                    height: 130,
                    width: 150,
                    color: Colors.grey,
                    img: "assets/images/items/r2.png",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 25,
            top: 330,
            child: Row(
              children: <Widget>[
                OnboardingImageCard(
                  height: 150,
                  width: 175,
                  color: Colors.grey,
                  img: "assets/images/items/r2.png",
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 10),
                  child: OnboardingImageCard(
                    height: 200,
                    width: 115,
                    color: Colors.grey,
                    img: "assets/images/items/r1.png",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 630,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 49,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Swipe to see",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

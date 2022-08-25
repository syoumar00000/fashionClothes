import 'package:fashion/screens/authentication/widgets/authentication-layout.dart';
import 'package:fashion/screens/authentication/widgets/social-sign.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/outline-input.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationLayout(
        title: "Let's get something",
        subTitle: "Good to see you back.",
        child: Column(
          children: [
            const OutlineInput(
              padding: EdgeInsets.all(5),
              hint: "Email",
              prefix: Icon(Icons.email),
            ),
            kSpaceH(1),
            const OutlineInput(
              padding: EdgeInsets.all(5),
              hidden: true,
              hint: "Mot de passe",
              prefix: Icon(Icons.lock),
            ),
            kSpaceH(3),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, primary: Colors.black12),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Text(
                  "SIGN IN",
                  style: kHeadline6(context, Colors.black),
                ),
              ),
            ),
            kSpaceH(3),
            const Center(child: Text("Or sign with")),
            kSpaceH(1.5),
            //social sign buttons
            const SocialSign(),
            kSpaceH(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Don't have account ?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

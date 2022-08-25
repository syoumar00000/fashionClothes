import 'package:fashion/screens/authentication/widgets/authentication-layout.dart';
import 'package:fashion/screens/authentication/widgets/social-sign.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/outline-input.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationLayout(
        title: "Get Started",
        subTitle: "Create an account to continue !",
        child: Column(
          children: [
            const OutlineInput(
              padding: EdgeInsets.all(5),
              hint: "Full name",
              prefix: Icon(Icons.person_outline),
            ),
            kSpaceH(1),
            const OutlineInput(
              padding: EdgeInsets.all(5),
              hint: "Email",
              prefix: Icon(Icons.email),
            ),
            kSpaceH(1),
            const OutlineInput(
              padding: EdgeInsets.all(5),
              hint: "Mot de passe",
              hidden: true,
              prefix: Icon(Icons.lock),
            ),
            kSpaceH(2),
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
                  "SIGN UP",
                  style: kHeadline6(context),
                ),
              ),
            ),
            kSpaceH(3),
            const Center(
              child: Text("Or sign with"),
            ),
            kSpaceH(1.5),
            //social sign buttons
            const SocialSign(),
            kSpaceH(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Already have an account ?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signin");
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

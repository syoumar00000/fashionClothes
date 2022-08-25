import 'package:fashion/screens/success/success-screen.dart';
import 'package:fashion/styles/button-style.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/outline-input.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: "Contact us",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kBodyPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Can we help you?",
                style: kHeadline6(context),
              ),
              kSpaceH(3),
              Image.asset(
                "assets/images/misc/support.png",
                width: 75,
              ),
              kSpaceH(4),
              OutlineInput(
                label: "Subject",
              ),
              kSpaceH(3),
              OutlineInput(
                lines: 5,
                maxLength: 500,
                label: "Write us your message",
              ),
              kSpaceH(3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: kBlackButtonStyle,
                  child: Text(
                    "Send",
                    style: kSubtitle1(context, Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(
                          buttonTitle: "Go Back",
                          title: "Support Ticket #74893",
                          description:
                              "Thank you for contacting us, your request has been forwarded and we will get back to you shortly. You can continue shopping in the meantime.",
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:fashion/widgets/input/outline-input.dart';

class AccountEditScreen extends StatefulWidget {
  const AccountEditScreen({Key? key}) : super(key: key);

  @override
  _AccountEditScreenState createState() => _AccountEditScreenState();
}

class _AccountEditScreenState extends State<AccountEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: "Edit profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: kBodyPadding,
          child: Column(
            children: [
              kSpaceH(3.5),
              //image display and edit button
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/misc/avatar.jpg",
                      width: 125,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    width: 35,
                    height: 35,
                    child: SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const CircleBorder(),
                            primary: Colors.white,
                            padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: Image.asset(
                          "assets/icons/crayon.png",
                          width: 20,
                          //color: Colors.grey.shade400,
                        ),
                        // const Icon(
                        //   Icons.edit,
                        //   size: 20,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              kSpaceH(4),
              const OutlineInput(
                padding: EdgeInsets.all(5),
                hint: "Full name",
                prefix: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
              ),
              kSpaceH(1),
              const OutlineInput(
                padding: EdgeInsets.all(5),
                hint: "Email",
                prefix: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
              kSpaceH(1),
              const OutlineInput(
                padding: EdgeInsets.all(5),
                hint: "Mot de passe",
                hidden: true,
                prefix: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              kSpaceH(4),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save & continue",
                    style: kHeadline6(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

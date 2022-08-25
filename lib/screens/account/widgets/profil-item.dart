import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class ProfilItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function() onTap;

  const ProfilItem(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: kBodyPadding.copyWith(top: 18, bottom: 18),
        child: Row(
          children: [
            icon,
            kSpaceW(1),
            Text(
              title,
              style: kSubtitle1(context)?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

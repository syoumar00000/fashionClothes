import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';

//bullets list
class AboutBullets extends StatelessWidget {
  final List<String> contents;

  const AboutBullets({
    Key? key,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: contents
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.circle, size: 8),
                  kSpaceW(1),
                  Flexible(child: Text(e))
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

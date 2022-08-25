import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class AboutTitle extends StatelessWidget {
  final String header;

  const AboutTitle({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: kHeadline5(context)?.copyWith(color: Colors.black87),
    );
  }
}

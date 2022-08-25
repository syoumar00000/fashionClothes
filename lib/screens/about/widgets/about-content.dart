import 'package:flutter/material.dart';

//about context text (long text)
class AboutContent extends StatelessWidget {
  final String content;

  const AboutContent({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

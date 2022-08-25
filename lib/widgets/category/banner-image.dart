import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String image;

  const BannerImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

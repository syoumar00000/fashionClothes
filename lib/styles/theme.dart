import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.grey,
    //add custom font to your app
    textTheme: GoogleFonts.sourceSansProTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}

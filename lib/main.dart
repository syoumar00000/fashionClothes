import 'package:flutter/material.dart';
import 'package:fashion/configs/routes.dart';
import 'package:fashion/providers/providers.dart';
import 'package:fashion/screens/loading/loading-screen.dart';
import 'package:fashion/styles/theme.dart';
import 'package:fashion/utils/external-licence.dart';
import 'package:provider/provider.dart';

//entry widget
//food ordering are built on top of null safety
void main() {
  //register font licence
  registryFontLicence();
  //app entry
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mb Fashion',
        routes: routes,
        theme: theme(context),
        home: LoadingScreen(),
      ),
    );
  }
}

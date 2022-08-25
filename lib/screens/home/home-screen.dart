import 'package:fashion/widgets/navigation/main-tabbar.dart';
import 'package:fashion/widgets/navigation/main-bottombar.dart';
import 'package:fashion/widgets/navigation/monmain-appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [MonMainAppbar(), MainTabBar()],
        ),
      ),
      bottomNavigationBar: const MainBottomBar(
        currentIndex: 0,
      ),
    );
  }
}

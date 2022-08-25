import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';

//bottom bar navigation item

class MainBottomBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Widget icon;
  final String title;
  //callback for main navigation bottom bar when current item changes
  final Function onPressed;

  const MainBottomBarItem({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: index != currentIndex
            ? TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  primary: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    kSpaceW(0.5),
                    Text(title),
                  ],
                ),
                //icon,
                key: ValueKey<bool>(index == currentIndex),
                onPressed: () {
                  //callback for main navigation bottom bar when current item changes
                  onPressed(index);
                })
            : TextButton(
                key: ValueKey<bool>(index == currentIndex),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  primary: Colors.black,
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    kSpaceW(0.5),
                    Text(title),
                  ],
                ),
              ),
        duration: const Duration(milliseconds: 350),
      ),
    );
  }
}

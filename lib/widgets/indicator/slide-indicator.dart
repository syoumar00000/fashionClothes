import 'package:flutter/material.dart';

//indicator for slide or step
class SlideIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const SlideIndicator({
    Key? key,
    this.currentIndex = 0,
    this.itemCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < itemCount; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(
                //horizontal: 4.0,
                vertical: 5.0,
              ),
              height: currentIndex == i ? 22.0 : 7.0,
              width: 10.0,
              decoration: BoxDecoration(
                color: currentIndex == i ? Colors.red : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            )
        ],
      ),
    );
  }
}

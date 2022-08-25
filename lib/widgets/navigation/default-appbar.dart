import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? icon;
  final bool showBackButton;

  const DefaultAppBar(
      {Key? key, required this.title, this.icon, this.showBackButton = true})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: false,
      backgroundColor: Colors.white,
      leading: showBackButton ? BackButton() : null,
      automaticallyImplyLeading: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: kHeadline6(context),
          ),
          //addIcon to the and off appBar
          if (this.icon != null) ...[Spacer(), this.icon!]
        ],
      ),
    );
  }
}

import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final String image;

  const AccountAppBar({
    Key? key,
    required this.username,
    required this.image,
  });

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset(
                  image,
                  width: 25,
                ),
              ),
            ),
            kSpaceW(1),
            Text(
              username,
              style: kSubtitle1(context)?.copyWith(
                  color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            "assets/icons/crayon.png",
            width: 17,
            //color: Colors.grey.shade400,
          ),
          //Icon(Icons.edit_outlined),
          onPressed: () {
            Navigator.pushNamed(context, "/account-edit");
          },
          iconSize: 22,
        )
      ],
    );
  }
}

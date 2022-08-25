import 'package:flutter/material.dart';

class OrderRow extends StatelessWidget {
  final Function()? action;
  final String? actionTitle;
  final Widget child;
  final String title;

  const OrderRow({
    Key? key,
    required this.title,
    this.action,
    required this.child,
    this.actionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              action != null
                  ? TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 20),
                      ),
                      onPressed: action,
                      child: Text(
                        actionTitle!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container()
            ],
          ),
          child
        ],
      ),
    );
  }
}

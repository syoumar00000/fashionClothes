import 'package:flutter/material.dart';

class DeliveryOptions extends StatelessWidget {
  final List<String> options;
  final String selected;
  final Function(String) onSelected;

  DeliveryOptions({
    Key? key,
    required this.options,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: ActionChip(
                  label: Text(
                    e,
                    style: TextStyle(
                      color: selected == e ? Colors.white : Colors.black,
                    ),
                  ),
                  backgroundColor:
                      selected == e ? Colors.black : Colors.grey.shade300,
                  onPressed: () {
                    onSelected(e);
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';

class FilterRange extends StatelessWidget {
  final RangeValues rangeValues;
  final Function(RangeValues) onChanged;
  final String title;
  final double? min;
  final double? max;
  final int? division;

  const FilterRange({
    Key? key,
    required this.rangeValues,
    required this.onChanged,
    required this.title,
    this.min,
    this.max,
    this.division,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        kSpaceH(1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(rangeValues.start.round().toString(),
                  style: kSubtitle1(context)
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: kSubtitle1(context),
                  ),
                ),
              ),
              Text(rangeValues.end.round().toString(),
                  style: kSubtitle1(context)
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          width: kScreenWitdh(context),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 1,
            ),
            child: RangeSlider(
              values: rangeValues,
              min: min ?? 0,
              max: max ?? 100,
              divisions: division ?? 50,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

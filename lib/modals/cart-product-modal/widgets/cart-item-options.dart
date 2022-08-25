import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/product.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';

//product options sush as drink etc.
class CartItemOptions extends StatelessWidget {
  final List<PriceItem> prices;
  final void Function(String?, [bool?]) onChanged;
  final PriceItem currentValue;
  final OptionItem option;

  const CartItemOptions({
    Key? key,
    required this.prices,
    required this.onChanged,
    required this.currentValue,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          option.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        //use radio custom can select only one option
        if (option.multiple == false)
          ...option.values
              .map(
                (e) => RadioListTile<String>(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  value: e,
                  title: Text(
                    e,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  groupValue:
                      option.selected!.isNotEmpty ? option.selected![0] : null,
                  onChanged: onChanged,
                ),
              )
              .toList(),
        //use checkbook custom can select only multiple options
        if (option.multiple == true)
          ...option.values
              .map(
                (e) => CheckboxListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  value: option.selected!.contains(e),
                  title: Text(
                    e,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onChanged: (bool? selected) => onChanged(e, selected),
                ),
              )
              .toList(),
        kSpaceH(0.5),
        Divider(),
        kSpaceH(0.5)
      ],
    );
  }
}

//price select options
class CartItemPriceOptions extends StatelessWidget {
  final List<PriceItem> prices;
  final Function(PriceItem?) onChanged;
  //final List<SizeItem> sizes;
  final PriceItem currentValue;

  const CartItemPriceOptions({
    Key? key,
    required this.prices,
    required this.onChanged,
    required this.currentValue,
    //required this.sizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Price",
          style: Theme.of(context).textTheme.headline6,
        ),
        //price option
        ...prices
            .map(
              (e) => RadioListTile<PriceItem>(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  value: e,
                  title: Text(
                    "${e.title} - $kCurrency${e.amount.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  groupValue: currentValue,
                  onChanged: onChanged),
            )
            .toList(),
        // Row(
        //   children: [
        //     Text(
        //       "Size",
        //       style: Theme.of(context).textTheme.headline6,
        //     ),
        //     // size option
        //     ...sizes
        //         .map(
        //           (e) => RadioListTile<SizeItem>(
        //               contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        //               value: e,
        //               title: Text(
        //                 "${e.label} - $kCurrency${e.label.toString()}",
        //                 style: const TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               groupValue: currentSizeValue,
        //               onChanged: onChangedSize
        //               ),
        //         )
        //         .toList(),
        //   ],
        // )
      ],
    );
  }
}

import 'package:fashion/models/address.dart';
import 'package:fashion/providers/address-provider.dart';
import 'package:fashion/screens/address/address-search-screen.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/input/full-black-button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//select address bottom sheet
Future<bool?> showAddressPicker(
  BuildContext context, {
  bool preview = true,
}) {
  return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final addressState =
            Provider.of<AddressProvider>(context, listen: true);
        Address? selectedAddress = addressState.selectedAddress;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => SafeArea(
            child: Container(
              constraints:
                  BoxConstraints(maxHeight: kScreenHeight(context) - 100),
              padding: kBodyPadding,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Addresses",
                              style: kHeadline6(context),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddressSearchScreen()));
                                },
                                child: Text(
                                  "Add new",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                        kSpaceH(2),
                        //address to select radio list
                        ...addressState.addresses
                            .map((e) => RadioListTile<Address>(
                                title: Text(
                                  e.formattedAddress,
                                ),
                                value: e,
                                groupValue: selectedAddress,
                                onChanged: (selected) {
                                  setState(() {
                                    selectedAddress = e;
                                  });
                                }))
                            .toList(),
                        kSpaceH(7),
                      ],
                    ),
                  ),
                  //select address confirmation button
                  selectedAddress != null
                      ? Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: kScreenWitdh(context) - 25,
                            child: FullBlackButton(
                              width: double.infinity,
                              onPressed: () {
                                addressState.selectAddress(selectedAddress!);
                                Navigator.pop(context);
                              },
                              label: "Select Address",
                            ),
                          ),
                        )
                      : Container(
                          height: 0,
                        ),
                ],
              ),
            ),
          ),
        );
      });
}

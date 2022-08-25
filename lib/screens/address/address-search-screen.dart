import 'package:fashion/models/address.dart';
import 'package:fashion/providers/address-provider.dart';
import 'package:fashion/styles/input-style.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/address/address-form-screen.dart';
import 'package:provider/provider.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({Key? key}) : super(key: key);

  @override
  _AddressSearchScreenState createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final addressState = Provider.of<AddressProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              //search textfield with close button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: noBorderInputDecoration.copyWith(
                          hintText: "Search your address",
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 12)),
                      onChanged: (String value) {
                        setState(() {
                          addressState.search(value);
                        });
                      },
                    ),
                  ),
                  const CloseButton(
                    color: Colors.black,
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: addressState.placeSuggestions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final suggestion = addressState.placeSuggestions[index];
                    //search result list item
                    return InkWell(
                      onTap: () async {
                        final placeDetails =
                            await addressState.getPlace(suggestion.placeId);
                        final address = Address()..build(placeDetails);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddressFormScreen(address: address),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.near_me_outlined,
                              size: 20,
                              color: Colors.black54,
                            ),
                            kSpaceW(1),
                            Flexible(child: Text(suggestion.description)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

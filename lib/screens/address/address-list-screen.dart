import 'package:fashion/providers/address-provider.dart';
import 'package:fashion/screens/address/address-form-screen.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({Key? key}) : super(key: key);

  @override
  _AddressListScreenState createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  @override
  Widget build(BuildContext context) {
    final addressState = Provider.of<AddressProvider>(context, listen: true);

    return Scaffold(
      appBar: const DefaultAppBar(
        title: "Addresses",
      ),
      body: ListView.builder(
          itemCount: addressState.addresses.length,
          itemBuilder: (ctx, index) {
            final address = addressState.addresses[index];

            //address list item
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressFormScreen(address: address),
                  ),
                );
              },
              child: Padding(
                padding: kBodyPadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.near_me_outlined,
                      size: 18,
                    ),
                    kSpaceW(1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address.address1,
                          style: kSubtitle1(context)
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        kSpaceH(0.4),
                        Text(address.address2)
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                        icon: const Icon(Icons.delete_outlined),
                        iconSize: 22,
                        onPressed: () {})
                  ],
                ),
              ),
            );
          }),
      //add new address
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, "/address-search");
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

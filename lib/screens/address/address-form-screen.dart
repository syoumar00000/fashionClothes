import 'dart:async';
import 'package:fashion/models/address.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/widgets/input/full-black-button.dart';
import 'package:fashion/widgets/input/outline-input.dart';
import 'package:flutter/material.dart';
import 'package:fashion/screens/address/widgets/address-delivery-option.dart';
import 'package:fashion/screens/address/widgets/address-mapview.dart';
import 'package:fashion/widgets/navigation/default-appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressFormScreen extends StatefulWidget {
  final Address address;
  const AddressFormScreen({Key? key, required this.address}) : super(key: key);

  @override
  _AddressFormScreenState createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  //addresse line 2 and delivery instruction control
  TextEditingController address2Ctrl = TextEditingController();
  TextEditingController instructionCtrl = TextEditingController();

  @override
  initState() {
    super.initState();

    //addresse marker for map
    _markers.add(
      Marker(
        infoWindow: InfoWindow(title: "My location"),
        markerId: MarkerId('location'),
        draggable: false,
        flat: true,
        position: LatLng(
          widget.address.location!.latitude,
          widget.address.location!.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final address = widget.address;

    print(
        "${address.address1} ${address.address2} ${address.location!.latitude} ${address.location!.longitude}");

    return Scaffold(
      appBar: DefaultAppBar(
        title: "Address",
        icon: Icon(Icons.near_me_outlined, color: Colors.grey.shade300),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //map view
            SizedBox(
              height: kScreenHeight(context) / 3,
              child: AddressMapView(
                markers: _markers,
                address: address,
                controller: _controller,
              ),
            ),
            //addresse line more details appartement / suit / building
            SizedBox(
              height: kScreenHeight(context) / 10,
              child: Padding(
                padding: kBodyPadding,
                child: OutlineInput(
                  controller: address2Ctrl,
                  label: "appt/suit/building",
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: kScreenHeight(context) / 3,
              child: Padding(
                padding: kBodyPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Delivery options"),
                    kSpaceH(2),
                    DeliveryOptions(
                      options: [
                        "in front of the door",
                        "hand delivery",
                        "Follow instructions"
                      ],
                      selected: address.deliveryOption,
                      onSelected: (String e) {
                        setState(() {
                          address.deliveryOption = e;
                        });
                      },
                    ),
                    OutlineInput(
                      lines: 2,
                      controller: instructionCtrl,
                      label: "Delivery instructions",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: kBodyPadding,
              child: FullBlackButton(
                width: double.infinity,
                height: 45,
                label: "Save and continue",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/address-list");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

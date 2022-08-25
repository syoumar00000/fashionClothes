import 'dart:async';
import 'package:fashion/models/address.dart';
import 'package:fashion/screens/address/address-search-screen.dart';
import 'package:fashion/styles/spacing-style.dart';
import 'package:fashion/styles/text-style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressMapView extends StatelessWidget {
  const AddressMapView({
    Key? key,
    required Set<Marker> markers,
    required this.address,
    required Completer<GoogleMapController> controller,
  })  : _markers = markers,
        _controller = controller,
        super(key: key);

  final Set<Marker> _markers;
  final Address address;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.terrain,
                zoomControlsEnabled: false,
                markers: _markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    address.location!.latitude,
                    address.location!.longitude,
                  ),
                  zoom: 16,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              //address modify button
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: kScreenWitdh(context) / 2,
                  height: 28,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressSearchScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                        kSpaceW(1),
                        const Text(
                          "Change location",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //customer selected address from search
        Padding(
          padding: kBodyPadding,
          child: Text(
            address.address1,
            style: kHeadline6(context),
          ),
        )
      ],
    );
  }
}

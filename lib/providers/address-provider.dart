import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:fashion/configs/app-config.dart';
import 'package:fashion/models/address.dart';
import 'package:fashion/models/place-suggestion.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressProvider extends ChangeNotifier {
  List<Address> _addresses = [];
  List<PlaceSuggestion> _placeSuggetions = [];
  Address? _selectedAddress;

  //search suggestion debounce timer
  Timer? _debounce;

  UnmodifiableListView<Address> get addresses =>
      UnmodifiableListView(_addresses);
  UnmodifiableListView<PlaceSuggestion> get placeSuggestions =>
      UnmodifiableListView(_placeSuggetions);
  Address? get selectedAddress => _selectedAddress;

  //get place suggestions via google autocomplete API
  search(String searchValue) async {
    if (_debounce != null) _debounce!.cancel();

    //debounce search suggestions for 600 ms
    _debounce = Timer(Duration(milliseconds: 750), () async {
      final request =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchValue&types=address&key=$kGoogleKey";

      final response = await http.get(Uri.parse(request));

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print(response.body);
        if (result['status'] == 'OK') {
          // compose suggestions in a list
          final results = result['predictions']
              .map<PlaceSuggestion>(
                  (p) => PlaceSuggestion(p['place_id'], p['description']))
              .toList();

          _placeSuggetions.addAll(results);
          notifyListeners();
        }
        if (result['status'] == 'ZERO_RESULTS') {
          return _placeSuggetions.addAll([]);
        }
        //throw Exception(result['error_message']);
      } else {
        throw Exception('Failed to fetch suggestion');
      }
    });
  }

  //get place details via google place API
  Future<dynamic> getPlace(String placeId) async {
    final request =
        "https://maps.googleapis.com/maps/api/place/details/json?key=$kGoogleKey&place_id=$placeId";
    final response = await http.get(Uri.parse(request));
    return response;
  }

  //select or change current delivery address
  selectAddress(Address address) {
    _selectedAddress = address;
    notifyListeners();
  }

  //get all Addresses
  getAll() async {
    _addresses.addAll([
      Address(
        id: "1",
        address1: "10 Mcguire Crossing",
        address2: "15102 Sloan",
        city: "London",
        country: "United Kingdom",
        location: GeoPoint(
          112.320413,
          29.606391,
        ),
      ),
      Address(
        id: "2",
        address1: "928 Bartelt Court",
        address2: "2213 Brown Lane",
        city: "Strasbourg",
        country: "France",
        location: GeoPoint(
          7.6370168,
          48.5347071,
        ),
      ),
      Address(
        id: "3",
        address1: "928 Paris 25",
        address2: "avenue 2213",
        city: "Paris",
        country: "France",
        location: GeoPoint(
          7.6370168,
          48.5347071,
        ),
      )
    ]);
    if (addresses.isNotEmpty) _selectedAddress = _addresses[0];

    notifyListeners();
    return _addresses;
  }
}

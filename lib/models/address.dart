import 'dart:convert';

class Address {
  String? id;
  String address1;
  String address2;
  String city;
  String country;
  String zipCode;
  String deliveryOption;
  String intruction;
  GeoPoint? location;

  Address({
    this.id,
    this.address1 = "",
    this.address2 = "",
    this.zipCode = "",
    this.city = "",
    this.country = "",
    this.deliveryOption = "",
    this.intruction = "",
    this.location,
  });

  String get formattedAddress => "$address1, $address2, $city, $country";

  //build addresse from google place API results
  build(dynamic response) {
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        //location coordinates
        final geoLocation = result['result']['geometry']["location"];
        location = GeoPoint(geoLocation["lng"], geoLocation["lat"]);

        // find address element
        final components =
            result['result']['address_components'] as List<dynamic>;

        address1 = result['result']['formatted_address'];

        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('country')) {
            country = c['long_name'];
          }
          if (type.contains('locality')) {
            city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            zipCode = c['long_name'];
          }
        });
        return;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}

class GeoPoint {
  final double longitude;
  final double latitude;

  GeoPoint(this.longitude, this.latitude);
}

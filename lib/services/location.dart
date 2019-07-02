import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async{
    try {
      print('getCurrentLocation - start');
      var position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      print('getCurrentLocation - end');
      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
    return;
  }
}
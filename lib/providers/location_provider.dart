import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationProvider = StreamProvider.autoDispose<LocationData?>((ref) {
  final streamController = StreamController<LocationData?>();

  _determinePosition(streamController);

  return streamController.stream;
});

void _determinePosition(
    StreamController<LocationData?> streamController) async {
  Location location = Location();

  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  location.onLocationChanged.listen((LocationData location) {
    streamController.add(location);
  });

  LocationData initialPosition = await location.getLocation();
  streamController.add(initialPosition);
}

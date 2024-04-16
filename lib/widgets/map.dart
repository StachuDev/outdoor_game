import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:outdoor_game/models/place_location.dart';

class Map extends StatefulWidget {
  const Map({
    super.key,
    this.location = const PlaceLocation(
      latitude: 53.642,
      longitude: 21.786,
      address: '',
    ),
  });

  final PlaceLocation location;

  @override
  State<Map> createState() {
    return _MapsScreenState();
  }
}

class _MapsScreenState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Udaj się do: "),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("m1"),
            position: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
          ),
        },
      ),
    );
  }
}

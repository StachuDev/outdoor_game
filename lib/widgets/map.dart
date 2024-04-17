import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:outdoor_game/models/place_location.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    this.location = const PlaceLocation(
        latitude: 53.75370396489, longitude: 20.477546169471, address: ""),
    required this.destination,
  });

  final PlaceLocation location;
  final LatLng destination;

  @override
  State<MapWidget> createState() {
    return _MapsScreenState();
  }
}

class _MapsScreenState extends State<MapWidget> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/location_icon.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    addCustomIcon();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.location.latitude,
          widget.location.longitude,
        ),
        zoom: 16,
      ),
      markers: {
        // Marker(
        //   markerId: const MarkerId("m1"),
        //   position: LatLng(
        //     widget.location.latitude,
        //     widget.location.longitude,
        //   ),
        // ),
        Marker(
          markerId: const MarkerId("m1"),
          icon: markerIcon,
          position: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
        ),
      },
    );
  }
}

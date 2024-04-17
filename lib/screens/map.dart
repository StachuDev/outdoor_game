import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import 'package:outdoor_game/models/place_location.dart';
import 'package:outdoor_game/widgets/map.dart';
import 'package:outdoor_game/widgets/task_message.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Stream<LocationData>? _locationStream;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
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

    setState(() {
      _locationStream = location.onLocationChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isTaskOpen = false;

    void onTaskButtonClick() {
      final currentValue = isTaskOpen;
      setState(() {
        isTaskOpen = !currentValue;
      });
      print("it's works!");
    }

    LocationData initialLocation = LocationData.fromMap({
      "latitude": 53.75370396489,
      "longitude": 20.477546169471,
      "altitude": 0.0,
      "accuracy": 0.0,
      "speed": 0.0,
      "speed_accuracy": 0.0,
      "heading": 0.0,
      "time": DateTime.now().millisecondsSinceEpoch.toDouble(),
    });

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Twoje punkty: 0"),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(children: [
          StreamBuilder<LocationData>(
            stream: _locationStream,
            initialData: initialLocation,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return MapWidget(
                  destination: const LatLng(0, 0),
                  location: PlaceLocation(
                    latitude: snapshot.data!.latitude!,
                    longitude: snapshot.data!.longitude!,
                    address: "",
                  ),
                );
              }
            },
          ),
          const TaskMessage(
            child: Text("Bardzo ciekawa sprawa z tym wszystkim"),
          )
        ]),
      ),
    );
  }
}

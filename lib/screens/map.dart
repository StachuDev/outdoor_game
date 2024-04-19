// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:outdoor_game/providers/location_provider.dart';

import 'package:outdoor_game/widgets/map_widget.dart';
import 'package:outdoor_game/widgets/task_message.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  // Stream<LocationData>? _locationStream;
  String message = "Udaj się do wskazango punktu aby otrzymać wyzwanie!";

  @override
  Widget build(BuildContext context) {
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
          const MapWidget(
            destination: LatLng(53.64245403318, 21.7859866467),
          ),
          TaskMessage(
            destination: const LatLng(53.64245403318, 21.7859866467),
            child: Text(message),
          )
        ]),
      ),
    );
  }
}

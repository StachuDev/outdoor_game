import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:outdoor_game/providers/location_provider.dart';

class MapWidget extends ConsumerStatefulWidget {
  const MapWidget({
    super.key,
    required this.destination,
  });

  final LatLng destination;

  @override
  ConsumerState<MapWidget> createState() {
    return _MapsScreenState();
  }
}

class _MapsScreenState extends ConsumerState<MapWidget> {
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
    final currentLocation = ref.watch(locationProvider);

    return Column(
      children: [
        Expanded(
          child: currentLocation.when(
            data: (data) {
              final LatLng currentLatLng =
                  LatLng(data!.latitude!, data.longitude!);
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: currentLatLng,
                  zoom: 16,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("m1"),
                    position: widget.destination,
                  ),
                  Marker(
                    markerId: const MarkerId("m2"),
                    icon: markerIcon,
                    // infoWindow: const InfoWindow(title: "TEST, TEST"),
                    position: currentLatLng,
                  ),
                },
              );
            },
            error: (error, stackTrace) {
              debugPrint("$error");
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        const SizedBox(height: 60)
      ],
    );
  }
}

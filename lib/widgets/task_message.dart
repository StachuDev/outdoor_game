import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:outdoor_game/providers/location_provider.dart';

class TaskMessage extends ConsumerStatefulWidget {
  const TaskMessage({
    super.key,
    required this.child,
    required this.destination,
  });

  final LatLng destination;
  final Widget child;

  @override
  ConsumerState<TaskMessage> createState() => _TaskMessageState();
}

class _TaskMessageState extends ConsumerState<TaskMessage> {
  bool isOpen = false;
  void onButtonPress() {
    final currentValue = isOpen;
    setState(() {
      isOpen = !currentValue;
    });
  }

  bool _reachedDestination(
      double locationLat, double locationLng, LatLng destination) {
    final latDistance = (locationLat - destination.latitude).abs();
    final lngDistance = (locationLng - destination.longitude).abs();

    if (latDistance <= 0.00003 && lngDistance <= 0.00003) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final currentLocation = ref.watch(locationProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return currentLocation.when(
      data: (data) {
        final reachedDestination = _reachedDestination(
            data!.latitude!, data.longitude!, widget.destination);
        return Positioned(
          left: 0,
          bottom: isOpen ? 0 : -(height / 3) + 60,
          child: Container(
            color: Theme.of(context).colorScheme.onBackground,
            width: width,
            height: height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: double.infinity,
                  height: 60,
                  child: TextButton.icon(
                      onPressed: onButtonPress,
                      style: TextButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.onBackground),
                      label: Text(
                        "WYZWANIE",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(
                        isOpen
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                      )),
                ),
                const SizedBox(height: 20),
                widget.child,
                Text(reachedDestination ? "Jesteś u celu" : "Idź do celu"),
              ],
            ),
          ),
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
    );
  }
}

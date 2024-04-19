import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  const Place({
    required this.name,
    required this.isQR,
    required this.message,
    required this.coordinates,
    required this.story,
    this.answer,
  });

  final String name;
  final bool isQR;
  final List<String>? answer;
  final String message;
  final LatLng coordinates;
  final Story story;
}

class Story {
  const Story({required this.img, required this.tekst});

  final File img;
  final String tekst;
}

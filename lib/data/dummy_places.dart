import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:outdoor_game/models/place.dart';

final List<Place> dummyPlaces = [
  Place(
    name: "dom",
    isQR: true,
    message: "Twój kod znajduje się w pod ławką",
    coordinates: const LatLng(53.64244655132239, 21.78597860652117),
    story: Story(img: File("path"), tekst: "Ala ma kota"),
    answer: null,
  ),
  Place(
    name: "bunkier",
    isQR: false,
    message: "Twój kod znajduje się w pod ławką",
    coordinates: const LatLng(53.64102107774157, 21.787282939718715),
    story: Story(img: File("path"), tekst: "Ala ma kota"),
    answer: [""],
  ),
  Place(
    name: "las",
    isQR: false,
    message:
        "Z ostrych kłów to zwierzę słynie. Przyjaźń z nim niepewna. Ona locha on odyniec. Świnka to ich krewna",
    coordinates: const LatLng(53.64212324145997, 21.78499810326888),
    story: Story(img: File("path"), tekst: "Ala ma kota"),
    answer: ["dzik", "jeleń", "lis"],
  ),
  Place(
    name: "kapliczka",
    isQR: true,
    message: "Twój kod znajduje się w pod ławką",
    coordinates: const LatLng(53.642268177673586, 21.78573368536463),
    story: Story(img: File("path"), tekst: "Ala ma kota"),
  ),
];

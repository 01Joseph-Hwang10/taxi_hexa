import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/services.dart' show rootBundle;

BitmapDescriptor? markerSelected;
BitmapDescriptor? markerDefault;
BitmapDescriptor? currentLocation;
// String? darkMapStyle;
// String? lightMapStyle;

Future<void> preloadAssets() async {
  markerSelected = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration.empty,
    'assets/icons/marker-selected.png',
  );
  markerDefault = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration.empty,
    'assets/icons/marker-default.png',
  );
  currentLocation = await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(10, 10)),
    'assets/icons/bx_current-location.png',
  );
  // darkMapStyle = await rootBundle.loadString('assets/map/dark.json');
  // lightMapStyle = await rootBundle.loadString('assets/map/light.json');
}

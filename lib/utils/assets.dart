import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/services.dart' show rootBundle;

int _iconSize = 100;

BitmapDescriptor? markerSelected;
BitmapDescriptor? markerDefault;
BitmapDescriptor? currentLocation;
// String? darkMapStyle;
// String? lightMapStyle;

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  ByteData? byteData =
      await fi.image.toByteData(format: ui.ImageByteFormat.png);
  return byteData?.buffer.asUint8List() ?? Uint8List(0);
}

Future<void> preloadAssets() async {
  Uint8List markerSelectedBytes = await getBytesFromAsset(
    'assets/icons/marker-selected.png',
    _iconSize,
  );
  Uint8List markerDefaultBytes = await getBytesFromAsset(
    'assets/icons/marker-default.png',
    _iconSize,
  );
  Uint8List currentLocationBytes = await getBytesFromAsset(
    'assets/icons/bx_current-location.png',
    _iconSize,
  );
  markerSelected = BitmapDescriptor.fromBytes(
    markerSelectedBytes,
  );
  markerDefault = BitmapDescriptor.fromBytes(
    markerDefaultBytes,
  );
  currentLocation = BitmapDescriptor.fromBytes(
    currentLocationBytes,
  );
  // darkMapStyle = await rootBundle.loadString('assets/map/dark.json');
  // lightMapStyle = await rootBundle.loadString('assets/map/light.json');
}

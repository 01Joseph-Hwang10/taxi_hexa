
import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();


  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
          // Get.snackbar('', 'Location Permission Denied');
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

  if (permission == LocationPermission.deniedForever) {
  // Permissions are denied forever, handle appropriately.
  return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  }
  return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}


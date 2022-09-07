import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/taxi_map/notifier/map_notifier.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/utils/assets.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({
    Key? key,
  })  : currentLocation = const CurrentLocation(),
        super(key: key);

  final CurrentLocation currentLocation;

  @override
  Widget build(BuildContext context) {
    return ElevatedCircleButton(
      icon: Icons.gps_fixed,
      backgroundColor: AppColors.blue,
      borderColor: AppColors.white,
      onPressed: () async => currentLocation.show(context),
    );
  }
}

const currentLocationMarkerId = MarkerId('CurrentLocation');

class CurrentLocation {
  const CurrentLocation();

  Future<LatLng> load(BuildContext context) async {
    final bloc = context.read<LocationBloc>();
    final position = await _getLocation();
    final target = LatLng(
      position.latitude,
      position.longitude,
    );
    bloc.add(SetCurrentLocation(currentLocation: target));
    return target;
  }

  Future<void> show(BuildContext context) async {
    final bloc = context.read<LocationBloc>();
    final target = await load(context);
    bloc.add(
      AddMarkers(
        markers: [
          Marker(
            markerId: const MarkerId(
              'CurrentLocation',
            ),
            position: target,
            icon: currentLocation!,
          ),
        ],
      ),
    );
    final mapController = await bloc.state.controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: target,
          zoom: 15,
        ),
      ),
    );
    updateMap();
  }

  Future<Position> _getLocation() async {
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
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

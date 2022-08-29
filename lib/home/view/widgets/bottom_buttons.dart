import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/add_party/view/view.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          _CurrentLocationButton(),
          SizedBox(width: 5),
          _AddPartyButton(),
          SizedBox(width: 5),
          _RefreshButton(),
        ],
      ),
    );
  }
}

class _RefreshButton extends StatelessWidget {
  const _RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCircleButton(
      icon: Icons.sync,
      backgroundColor: AppColors.col2,
      borderColor: AppColors.col1,
      onPressed: () => {},
    );
  }
}

class _AddPartyButton extends StatelessWidget {
  const _AddPartyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCircleButton(
      icon: Icons.add,
      backgroundColor: AppColors.col2,
      borderColor: AppColors.col1,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          builder: (_) => const AddParty(),
        );
      },
    );
  }
}

class _CurrentLocationButton extends StatelessWidget {
  const _CurrentLocationButton({
    Key? key,
  }) : super(key: key);

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
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LocationBloc>();
    return ElevatedCircleButton(
      icon: Icons.gps_fixed,
      backgroundColor: AppColors.col2,
      borderColor: AppColors.col1,
      onPressed: () async {
        final position = await getLocation();
        final target = LatLng(
          position.latitude,
          position.longitude,
        );
        bloc.add(
          AddMarker(
            marker: Marker(
              markerId: MarkerId(
                const Uuid().v1(),
              ),
              position: target,
              icon: await BitmapDescriptor.fromAssetImage(
                ImageConfiguration.empty,
                'assets/icons/bx_current-location.png',
              ),
            ),
          ),
        );
        final mapController = await bloc.state.controller.future;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: target,
              zoom: 14,
            ),
          ),
        );
      },
    );
  }
}

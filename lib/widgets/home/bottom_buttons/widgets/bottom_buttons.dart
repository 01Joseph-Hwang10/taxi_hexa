import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/utils/constants.dart';
import 'package:taxi_hexa/widgets/common/elevated_circle_button.dart';
import 'package:taxi_hexa/widgets/home/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/widgets/home/my_location/my_location.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LocationBloc>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedCircleButton(
            icon: Icons.gps_fixed,
            backgroundColor: AppColors.col2,
            borderColor: AppColors.col1,
            onPressed: () async {
              final position = await getLocation();
              print(position);
            },
          ),
          const SizedBox(width: 5),
          ElevatedCircleButton(
            icon: Icons.add,
            backgroundColor: AppColors.col2,
            borderColor: AppColors.col1,
            onPressed: () {
              final _position = LatLng(
                  unistDormitory.latitude + Random().nextDouble() * pow(10, -2),
                  unistDormitory.longitude +
                      Random().nextDouble() * pow(10, -2));
              final _marker = Marker(
                //add first marker
                markerId: MarkerId(_position.toString()),
                position: _position, //position of markerxxx
                infoWindow: InfoWindow(
                  //popup info
                  title: 'Marker Title First ',
                  snippet: 'My Custom Subtitle',
                ),
                icon: BitmapDescriptor.defaultMarker, //Icon for Marker
              );
              bloc.add(AddMarker(marker: _marker));
            },
          ),
          const SizedBox(width: 5),
          ElevatedCircleButton(
            icon: Icons.sync,
            backgroundColor: AppColors.col2,
            borderColor: AppColors.col1,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}

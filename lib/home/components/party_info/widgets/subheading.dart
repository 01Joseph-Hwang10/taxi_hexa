import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/taxi_map/taxi_map.dart';

const destinationMarkerId = MarkerId('Destination');

class SubHeading extends StatelessWidget {
  const SubHeading({
    Key? key,
    required this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            party?.destinationAddress ?? "Unknown",
            softWrap: true,
          ),
        ),
        ActionButton(
          onPressed: () => moveCameraToDestination(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.map_outlined),
              SizedBox(width: 5),
              Text("지도"),
            ],
          ),
        ),
      ],
    );
  }

  void moveCameraToDestination(
    BuildContext context, [
    bool mounted = true,
  ]) async {
    if (party?.destination == null) return;
    final bloc = context.read<LocationBloc>();
    final currentTimer = bloc.state.timer;
    if (currentTimer?.isActive == true) currentTimer!.cancel();
    final mapController = await bloc.state.controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: party!.destination!,
          zoom: 15,
        ),
      ),
    );
    final marker = createDestinationMarker();
    bloc.add(
      AddMarker(
        marker: marker,
      ),
    );
    updateMap();
    if (!mounted) return;
    Navigator.of(context).maybePop();
    final timer = Timer(
      const Duration(seconds: 30),
      () {
        bloc.add(
          RemoveMarker(marker: marker),
        );
        updateMap();
      },
    );
    bloc.add(SetTimer(timer: timer));
  }

  Marker createDestinationMarker() {
    final marker = Marker(
      markerId: destinationMarkerId,
      position: LatLng(
        party!.destination!.latitude,
        party!.destination!.longitude,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    return marker;
  }
}

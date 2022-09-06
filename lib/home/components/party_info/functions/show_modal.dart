import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/location/location.dart';

void showPartyInfoModal(
  BuildContext context,
  TaxiPartyModel? party, [
  bool moveToDeparture = false,
]) async {
  if (party == null) return;
  final bloc = context.read<LocationBloc>();
  final locationState = bloc.state;
  bloc.add(
    SetFocusedPartyId(
      focusedPartyId: party.id,
    ),
  );
  if (moveToDeparture) {
    final target = party.currentPosition;
    final mapController = await locationState.controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: target!,
          zoom: 15,
        ),
      ),
    );
  }
  showModalBottomSheet(
    context: context,
    builder: (_) => const PartyInfo(),
  );
}

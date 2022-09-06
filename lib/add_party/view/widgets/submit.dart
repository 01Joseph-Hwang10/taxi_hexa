import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:taxi_hexa/add_party/utils/utils.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:uuid/uuid.dart';

class Submit extends StatelessWidget {
  const Submit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addPartyState = context.watch<AddPartyBloc>().state;
    bool disabled = false;
    if (addPartyState.name.isEmpty) disabled = true;
    if (addPartyState.departure == null) disabled = true;
    if (addPartyState.destination == null) disabled = true;
    return FullWidthButton(
      "택시팟 만들기",
      onPressed: () async => _onPressed(context),
      color: AppColors.blue,
      disabled: disabled,
    );
  }

  Future<void> _onPressed(BuildContext context, [bool mounted = true]) async {
    final locationBloc = context.read<LocationBloc>();
    final addPartyState = context.read<AddPartyBloc>().state;
    final locationState = locationBloc.state;
    final loginState = context.read<LoginBloc>().state;
    if (addPartyState.name == '') return;
    if (addPartyState.destination?.result?.name == null) return;
    if (addPartyState.departure == null) return;

    String id = const Uuid().v1();
    DatabaseReference ref = FirebaseDatabase.instance.ref(
      "parties/taxi_party${id.toString()}",
    );
    LatLng destination = await getDestinationCoordinate(
      addPartyState.destination,
    );
    TaxiPartyModel newParty = TaxiPartyModel(
      id: id,
      name: addPartyState.name,
      destination: destination,
      destinationAddress:
          addPartyState.destination!.result!.formattedAddress!, // 주소
      currentPosition: locationState.currentLocation,
      members: <String>[loginState.userInfo?.id ?? "<unknown>"],
      departure: addPartyState.departure!,
      description: addPartyState.description,
    );
    await ref.set(
      newParty.toJson(),
    );
    if (!mounted) return;
    Navigator.of(context).pop();
    final target = newParty.currentPosition;
    final mapController = await locationState.controller.future;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: target!,
          zoom: 15,
        ),
      ),
    );
    locationBloc.add(
      SetFocusedPartyId(
        focusedPartyId: newParty.id,
      ),
    );
    locationBloc.add(
      SetJoinedPartyId(
        joinedPartyId: newParty.id,
      ),
    );
  }
}

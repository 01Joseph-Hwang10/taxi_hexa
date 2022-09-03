import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
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
    //if (addPartyState.destination == null) disabled = true;
    return FullWidthButton(
      "택시팟 만들기",
      onPressed: () async => _onPressed(context),
      color: AppColors.blue,
      disabled: disabled,
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final addPartyState = context.read<AddPartyBloc>().state;
    final locationState = context.read<LocationBloc>().state;
    final loginState = context.read<LoginBloc>().state;
    if (addPartyState.name == '') return;
    //if (addPartyState.destination?.description == null) return;
    if (addPartyState.departure == null) return;

    String id = const Uuid().v1();
    DatabaseReference ref = FirebaseDatabase.instance.ref(
      "parties/taxi_party${id.toString()}",
    );
    /*LatLng destination = await getDestinationCoordinate(
      context,
      addPartyState.destination!.placeId!,
    );*/
    TaxiPartyModel newParty = TaxiPartyModel(
      id: id,
      name: addPartyState.name,
      destination: new LatLng(35.90776, 127.7669), //destination,
      destinationAddress:
          "Somewhere Over the Rainbow", //addPartyState.destination!.description!, // 주소
      currentPosition:
          new LatLng(35.907757, 127.766922), //locationState.currentLocation,
      members: (loginState.isLoggedIn)
          ? <String?>[loginState.userInfo?.id]
          : <String?>[currentuser!.user!.uid.toString()],
      departure: addPartyState.departure!,
      description: addPartyState.description,
    );
    await ref.set(
      newParty.toJson(),
    );
  }

  Future<LatLng> getDestinationCoordinate(
    BuildContext context,
    String placeId,
  ) async {
    final googlePlace = context.read<AddPartyBloc>().state.googlePlace;
    final detailsResponse = await googlePlace!.details.get(placeId);
    final location = detailsResponse!.result!.geometry!.location!;
    return LatLng(location.lat!, location.lng!);
  }
}
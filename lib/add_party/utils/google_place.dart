import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';

Future<DetailsResponse?> getDetailsResponse(
  BuildContext context,
  String placeId,
) async {
  final bloc = context.read<AddPartyBloc>();
  final googlePlace = bloc.state.googlePlace;
  final detailsResponse = await googlePlace!.details.get(placeId);
  return detailsResponse;
}

Future<LatLng> getDestinationCoordinate(
  DetailsResponse? detailsResponse,
) async {
  final location = detailsResponse!.result!.geometry!.location!;
  return LatLng(location.lat!, location.lng!);
}

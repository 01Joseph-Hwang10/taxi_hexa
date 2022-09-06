// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:taxi_hexa/home/components/party_info/widgets/widgets.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:taxi_hexa/taxi_map/taxi_map.dart';

class PartyInfo extends StatelessTaxiMapListener {
  const PartyInfo({Key? key}) : super(key: key);
  @override
  Widget buildWithMapUpdate(BuildContext context) {
    final locationState = context.watch<LocationBloc>().state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    return BottomModal(
      children: [
        const DragBar(),
        const SizedBox(height: 10),
        Heading(party: party),
        SubHeading(party: party),
        const SizedBox(height: 10),
        Departure(party: party),
        const SizedBox(height: 3),
        Members(party: party),
        Description(party: party),
        const JoinButton(),
        const SizedBox(height: 10),
      ],
    );
  }
}

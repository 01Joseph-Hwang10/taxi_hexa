// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/themes/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          party!.name,
          textAlign: TextAlign.start,
          style: AppTextStyles.heading1,
        ),
        buildAction(context),
      ],
    );
  }

  Widget buildAction(BuildContext context) {
    final loginState = context.watch<LoginBloc>().state;
    final locationState = context.watch<LocationBloc>().state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    final currentUser = loginState.userInfo;
    final isCreator = currentUser?.id == party?.members.first;
    if (isCreator) {
      return IconButton(
        onPressed: () => remove(context),
        icon: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.black54,
        ),
      );
    }
    return const SizedBox();
  }

  void remove(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    final locationState = locationBloc.state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    FirebaseDatabase.instance.ref("parties/taxi_party${party?.id}").remove();
    Navigator.of(context).maybePop();
    locationBloc.add(
      const SetJoinedPartyId(joinedPartyId: null),
    );
  }
}

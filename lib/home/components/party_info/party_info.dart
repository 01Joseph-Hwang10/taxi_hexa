// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:taxi_hexa/home/components/action_button.dart';
import 'package:taxi_hexa/home/components/party_info/widgets/widgets.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/themes/text_styles.dart';
import 'package:firebase_database/firebase_database.dart';

class PartyInfo extends StatelessWidget {
  const PartyInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final locationState = context.watch<LocationBloc>().state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    return BottomModal(
      children: [
        const DragBar(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              party!.name,
              textAlign: TextAlign.start,
              style: AppTextStyles.heading,
            ),
            buildAction(context),
          ],
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        SubHeading(party: party),
        const SizedBox(height: 10),
        Departure(party: party),
        const SizedBox(height: 3),
        Members(party: party),
        const SizedBox(height: 10),
        Description(party: party),
        const SizedBox(height: 10),
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
    final joined = party?.members.contains(loginState.userInfo?.id) ?? false;
    if (isCreator) {
      return ActionButton(
        onPressed: () {
          FirebaseDatabase.instance
              .ref("parties/taxi_party${party?.id}")
              .remove();
        },
        child: const Text("삭제"),
      );
    }
    if (joined) {
      return ActionButton(
        onPressed: () {
          party?.members.remove(currentUser!.id);
          FirebaseDatabase.instance.ref().update(
            {"parties/taxi_party${party?.id}/members": party?.members},
          );
        },
        child: const Text("탈퇴"),
      );
    }
    if (!joined) {
      return ActionButton(
        onPressed: () {
          party?.members.add(currentUser!.id);
          FirebaseDatabase.instance.ref().update(
            {
              "parties/taxi_party${party?.id}/members": party?.members,
            },
          );
        },
        child: const Text("참여"),
      );
    }
    return const SizedBox();
  }
}

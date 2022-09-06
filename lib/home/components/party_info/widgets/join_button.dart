// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:collection/collection.dart';
import 'package:taxi_hexa/taxi_map/taxi_map.dart';
import 'package:taxi_hexa/themes/colors.dart';

class JoinButton extends StatelessTaxiMapListener {
  const JoinButton({Key? key}) : super(key: key);

  @override
  Widget buildWithMapUpdate(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    final locationState = locationBloc.state;
    final loginState = context.read<LoginBloc>().state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    final currentUser = loginState.userInfo;
    final isCreator = currentUser?.id == party?.members.first;
    final joined = party?.members.contains(loginState.userInfo?.id) ?? false;
    if (isCreator) {
      return const SizedBox();
    }
    if (joined) {
      return FullWidthButton(
        "탈퇴하기",
        onPressed: () => exit(context),
        color: Colors.grey,
      );
    } else {
      return FullWidthButton(
        "참여하기",
        onPressed: () => join(context),
        color: AppColors.orange,
      );
    }
  }

  void exit(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    final locationState = locationBloc.state;
    final loginState = context.read<LoginBloc>().state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    final currentUser = loginState.userInfo;
    party?.members.remove(currentUser!.id);
    FirebaseDatabase.instance.ref().update(
      {"parties/taxi_party${party?.id}/members": party?.members},
    );
    locationBloc.add(
      const SetJoinedPartyId(joinedPartyId: null),
    );
    updateMap();
    Navigator.of(context).maybePop();
  }

  void join(
    BuildContext context, [
    bool mounted = true,
  ]) async {
    final locationBloc = context.read<LocationBloc>();
    final locationState = locationBloc.state;
    final loginState = context.read<LoginBloc>().state;
    final party = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.focusedPartyId,
    );
    final currentUser = loginState.userInfo;
    party?.members.add(currentUser!.id);
    FirebaseDatabase.instance.ref().update(
      {
        "parties/taxi_party${party?.id}/members": party?.members,
      },
    );
    final target = party?.currentPosition;
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
      const SetFocusedPartyId(focusedPartyId: null),
    );
    locationBloc.add(
      SetJoinedPartyId(
        joinedPartyId: party!.id,
      ),
    );
    updateMap();
    if (!mounted) return;
    Navigator.of(context).maybePop();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/absolute_align/interface/interface.dart';
import 'package:taxi_hexa/home/components/app_bar/app_bar.dart';
import 'package:taxi_hexa/home/components/current_party/current_party.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/location/constant/constant.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/login/models/user.dart';
import 'package:taxi_hexa/taxi_map/taxi_map.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = context.watch<LocationBloc>();
    final joinedPartyId = locationBloc.state.joinedPartyId;
    attachPostFrameCallback(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Map
          const TaxiMap(),
          // Bottom Buttons
          AbsoluteAlign(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            animation: AbsoluteAlignAnimation(
              verticalMovement: currentPartyFloatHeight,
              isActive: hasJoinedParty(joinedPartyId),
            ),
            child: const BottomButtons(),
          ),
          // Joined Party Info
          AbsoluteAlign(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            animation: AbsoluteAlignAnimation(
              verticalMovement: -currentPartyFloatHeight,
              isActive: !hasJoinedParty(joinedPartyId),
            ),
            child: const CurrentParty(),
          ),
          // App Bar
          AbsoluteAlign(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            child: const CustomAppBar(),
          )
        ],
      ),
    );
  }

  void attachPostFrameCallback(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final state = bloc.state;
    if (!state.isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final currentUser = await FirebaseAuth.instance.signInAnonymously();
        bloc.add(
          LoggedIn(
            UserModel(
              id: currentUser.user!.uid,
              name: "Anonymous",
            ),
          ),
        );
      });
    }
  }

  bool hasJoinedParty(String? joinedPartyId) {
    if (joinedPartyId == null) return false;
    if (joinedPartyId == noJoinedPartyId) return false;
    return true;
  }
}

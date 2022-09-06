import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/current_party/widgets/current_party_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/home/components/party_info/functions/functions.dart';
import 'package:taxi_hexa/location/location.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:taxi_hexa/themes/colors.dart';

const double currentPartyFloatHeight = 120;

class CurrentParty extends StatelessWidget {
  const CurrentParty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationState = context.watch<LocationBloc>().state;
    final joinedParty = locationState.parties.firstWhereOrNull(
      (party) => party.id == locationState.joinedPartyId,
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: currentPartyFloatHeight,
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => showPartyInfoModal(context, joinedParty, true),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: AppColors.orange,
              width: 2,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 15,
              ),
            ],
          ),
          child: CurrentPartyTitle(
            party: joinedParty,
          ),
        ),
      ),
    );
  }
}

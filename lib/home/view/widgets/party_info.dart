import 'package:flutter/material.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:taxi_hexa/login/bloc/login_bloc.dart';
import 'package:taxi_hexa/themes/text_styles.dart';
import 'package:firebase_database/firebase_database.dart';

class PartyInfo extends StatelessWidget {
  PartyInfo({Key? key}) : super(key: key);
  bool joinActive = true;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<LocationBloc>().state;
    final party = state.parties.firstWhereOrNull(
      (party) => party.id == state.focusedPartyId,
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
            (currentuser!.user!.uid.toString() == party.members.first)
                ? ElevatedButton(onPressed: () {}, child: Text("수정"))
                : (party.members
                        .where((element) =>
                            element == currentuser!.user!.uid.toString())
                        .isEmpty)
                    ? ElevatedButton(
                        onPressed: (joinActive)
                            ? () {
                                party.members
                                    .add(currentuser!.user!.uid.toString());
                                FirebaseDatabase.instance.ref().update({
                                  "parties/taxi_party${party.id}/members":
                                      party.members
                                });
                                joinActive = false;
                              }
                            : null,
                        child: Text("참여"))
                    : ElevatedButton(
                        onPressed: (joinActive)
                            ? () {
                                party.members
                                    .remove(currentuser!.user!.uid.toString());
                                FirebaseDatabase.instance.ref().update({
                                  "parties/taxi_party${party.id}/members":
                                      party.members
                                });
                                joinActive = false;
                              }
                            : null,
                        child: Text("탈퇴")),
          ],
        ),
        const SizedBox(height: 10),
        Text("인원 수: ${party.members.length.toString()}명"),
        const SizedBox(height: 10),
        _SubHeading(party: party),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _SubHeading extends StatelessWidget {
  const _SubHeading({
    Key? key,
    required this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(party?.description ?? ""),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.map_outlined),
              Text("지도"),
            ],
          ),
        ),
      ],
    );
  }
}

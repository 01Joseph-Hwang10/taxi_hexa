import 'package:flutter/material.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';
import 'package:taxi_hexa/themes/text_styles.dart';

class PartyInfo extends StatelessWidget {
  const PartyInfo({Key? key}) : super(key: key);

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
        Text(
          party!.name,
          textAlign: TextAlign.start,
          style: AppTextStyles.heading,
        ),
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

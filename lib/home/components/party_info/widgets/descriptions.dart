import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("설명: ${party?.description}")],
    );
  }
}

class Members extends StatelessWidget {
  const Members({
    Key? key,
    required this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time),
        Text("인원: ${party?.members.length.toString()}명"),
      ],
    );
  }
}

class Departure extends StatelessWidget {
  const Departure({
    Key? key,
    required this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time),
        Text("출발: ${party?.departure?.toString()}")
      ],
    );
  }
}

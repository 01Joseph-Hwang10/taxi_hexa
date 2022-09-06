import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({
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
        Container(
          width: 250,
          height: null,
          child: Text(
            "목적지: ${party!.destinationAddress}",
          ),
        ),
        ActionButton(
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

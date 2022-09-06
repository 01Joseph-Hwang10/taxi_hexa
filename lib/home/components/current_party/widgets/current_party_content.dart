// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/party_info/widgets/widgets.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/themes/text_styles.dart';

class CurrentPartyContent extends StatelessWidget {
  const CurrentPartyContent({
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
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                party?.name ?? "Unknown",
                textAlign: TextAlign.start,
                style: AppTextStyles.heading1,
              ),
              Text(
                party?.destinationAddress ?? "Unknown",
                softWrap: true,
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Departure(party: party),
            const SizedBox(height: 3),
            Members(party: party),
          ],
        ),
      ],
    );
  }
}

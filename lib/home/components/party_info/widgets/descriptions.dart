import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/themes/text_styles.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.party,
  }) : super(key: key);

  final TaxiPartyModel? party;

  @override
  Widget build(BuildContext context) {
    if (party?.description == null) return buildPlaceholder();
    if (party!.description!.isEmpty) return buildPlaceholder();
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(party?.description ?? ""),
    );
  }

  Widget buildPlaceholder() {
    return const SizedBox(
      height: 10,
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
        const Icon(
          Icons.people_rounded,
          size: 30,
          color: Colors.black87,
        ),
        const SizedBox(width: 5),
        Text(
          "인원: ${party?.members.length.toString()}명",
          style: AppTextStyles.body1,
        ),
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
        const Icon(
          Icons.access_time,
          size: 30,
          color: Colors.black87,
        ),
        const SizedBox(width: 5),
        Text(
          "출발: ${formatTime(party?.departure)}",
          style: AppTextStyles.body1,
        )
      ],
    );
  }

  String formatTime(DateTime? dateTime) {
    if (dateTime == null) return "";
    return "${dateTime.hour}:${dateTime.minute}";
  }
}

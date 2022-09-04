import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/add_party/utils/utils.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    Key? key,
    required this.predictions,
  }) : super(key: key);

  final List<AutocompletePrediction> predictions;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddPartyBloc>();
    return Expanded(
      child: ListView.builder(
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          final prediction = predictions[index];
          return ListTile(
            leading: const _PlaceIcon(),
            title: Text(prediction.description ?? "Unknown"),
            onTap: ([bool mounted = true]) async {
              final destination =
                  await getDetailsResponse(context, prediction.placeId!);
              bloc.add(
                SetDestinationAddress(
                  destination: destination,
                ),
              );
              if (!mounted) return;
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

class _PlaceIcon extends StatelessWidget {
  const _PlaceIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      child: Icon(
        Icons.pin_drop,
        color: Colors.white,
      ),
    );
  }
}

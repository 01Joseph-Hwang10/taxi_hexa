// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:taxi_hexa/add_party/components/find_address/widgets/widgets.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/location/location.dart';

InputDecoration _textFieldDecoration = const InputDecoration(
  labelText: "장소를 검색하세요",
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black54,
      width: 2.0,
    ),
  ),
);

class FindAddress extends StatefulWidget {
  const FindAddress({Key? key}) : super(key: key);
  @override
  _FindAddressState createState() => _FindAddressState();
}

class _FindAddressState extends State<FindAddress> {
  List<AutocompletePrediction> predictions = [];
  void setPrediections(List<AutocompletePrediction> predictions) {
    setState(() {
      this.predictions = predictions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CupertinoBackButton(),
        title: const Text(
          "목적지 검색",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: _textFieldDecoration,
                onChanged: (value) => onTextFieldChanged(context, value),
              ),
              const SizedBox(height: 10),
              SearchResultList(predictions: predictions),
            ],
          ),
        ),
      ),
    );
  }

  void onTextFieldChanged(BuildContext context, String value) {
    if (value.isNotEmpty) {
      autoCompleteSearch(context, value);
      return;
    }
    if (predictions.isNotEmpty) setPrediections(predictions);
  }

  void autoCompleteSearch(BuildContext context, String value) async {
    final googlePlace = context.read<AddPartyBloc>().state.googlePlace;
    final currentLocation = context.read<LocationBloc>().state.currentLocation;
    final origin = currentLocation != null
        ? LatLon(currentLocation.latitude, currentLocation.longitude)
        : null;
    AutocompleteResponse? result = await googlePlace!.autocomplete.get(
      value,
      origin: origin,
      radius: 10 * 1000, // 10km
      region: 'KR',
      language: 'ko',
    );
    if (result == null) return;
    if (result.predictions == null) return;
    if (!mounted) return;
    setPrediections(result.predictions!);
  }
}

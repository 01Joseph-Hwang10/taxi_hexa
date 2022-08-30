import 'dart:collection';
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'taxi_party.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TaxiPartyModel {
  String id;
  String name;
  String destinationAddress;
  List<String?> members;
  String? description;

  @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
  LatLng? destination;
  @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
  LatLng? currentPosition;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? departure;

  TaxiPartyModel({
    required this.id,
    required this.name,
    required this.destination,
    required this.destinationAddress,
    required this.currentPosition,
    required this.members,
    required this.departure,
    this.description,
  });

  factory TaxiPartyModel.fromJson(Map<String, dynamic> json) =>
      _$TaxiPartyModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaxiPartyModelToJson(this);

  static String latLngToJson(LatLng? latLng) => jsonEncode(latLng != null
      ? {'latitude': latLng.latitude, 'longitude': latLng.longitude}
      : null);

  static LatLng? latLngFromJson(String jsonString) {
    final LinkedHashMap<String, dynamic>? jsonMap = jsonDecode(jsonString);

    return jsonMap != null
        ? LatLng(jsonMap['latitude'], jsonMap['longitude'])
        : null;
  }

  static String dateTimeToJson(DateTime? dateTime) => jsonEncode(
        dateTime != null
            ? {
                'year': dateTime.year,
                'month': dateTime.month,
                'day': dateTime.day,
                'hour': dateTime.hour,
                'minute': dateTime.minute,
                'second': dateTime.second
              }
            : null,
      );

  static DateTime? dateTimeFromJson(String jsonString) {
    final LinkedHashMap<String, dynamic>? jsonMap = jsonDecode(jsonString);

    return jsonMap != null
        ? DateTime(
            jsonMap['year'],
            jsonMap['month'],
            jsonMap['day'],
            jsonMap['hour'],
            jsonMap['minute'],
            jsonMap['second'],
          )
        : null;
  }
}

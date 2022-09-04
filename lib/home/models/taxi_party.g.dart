// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxi_party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxiPartyModel _$TaxiPartyModelFromJson(Map<String, dynamic> json) =>
    TaxiPartyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      destination: TaxiPartyModel.latLngFromJson(json['destination'] as String),
      destinationAddress: json['destination_address'] as String,
      currentPosition:
          TaxiPartyModel.latLngFromJson(json['current_position'] as String),
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      departure: TaxiPartyModel.dateTimeFromJson(json['departure'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TaxiPartyModelToJson(TaxiPartyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'destination_address': instance.destinationAddress,
      'members': instance.members,
      'description': instance.description,
      'destination': TaxiPartyModel.latLngToJson(instance.destination),
      'current_position': TaxiPartyModel.latLngToJson(instance.currentPosition),
      'departure': TaxiPartyModel.dateTimeToJson(instance.departure),
    };

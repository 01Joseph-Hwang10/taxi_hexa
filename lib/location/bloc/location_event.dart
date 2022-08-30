part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class MapLoaded extends LocationEvent {
  final Completer<GoogleMapController> controller;
  const MapLoaded({required this.controller});

  @override
  List<Object> get props => [controller];
}

class AddMarkers extends LocationEvent {
  final List<Marker> markers;
  const AddMarkers({required this.markers});

  @override
  List<Object> get props => [markers];
}

class AddMarker extends LocationEvent {
  final Marker marker;
  const AddMarker({required this.marker});

  @override
  List<Object> get props => [marker];
}

class UpdateMarker extends LocationEvent {
  final Marker marker;
  const UpdateMarker({required this.marker});

  @override
  List<Object> get props => [marker];
}

class RemoveMarker extends LocationEvent {
  final Marker marker;
  const RemoveMarker({required this.marker});

  @override
  List<Object> get props => [marker];
}

class AddParties extends LocationEvent {
  final List<TaxiPartyModel> parties;
  const AddParties({required this.parties});

  @override
  List<Object> get props => [parties];
}

class AddParty extends LocationEvent {
  final TaxiPartyModel party;
  const AddParty({required this.party});

  @override
  List<Object> get props => [party];
}

class UpdateParty extends LocationEvent {
  final TaxiPartyModel party;
  const UpdateParty({required this.party});

  @override
  List<Object> get props => [party];
}

class RemoveParty extends LocationEvent {
  final TaxiPartyModel party;
  const RemoveParty({required this.party});

  @override
  List<Object> get props => [party];
}

class SetCurrentLocation extends LocationEvent {
  final LatLng? currentLocation;
  const SetCurrentLocation({required this.currentLocation});

  @override
  List<Object?> get props => [currentLocation];
}

class SetFocusedPartyId extends LocationEvent {
  final String? focusedPartyId;
  const SetFocusedPartyId({required this.focusedPartyId});

  @override
  List<Object?> get props => [focusedPartyId];
}

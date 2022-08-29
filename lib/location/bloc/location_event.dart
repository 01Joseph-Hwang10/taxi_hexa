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

class AddMarker extends LocationEvent {
  final Marker marker;
  const AddMarker({required this.marker});

  @override
  List<Object> get props => [marker];
}

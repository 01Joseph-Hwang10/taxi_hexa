part of 'my_location_bloc.dart';

abstract class MyLocationEvent extends Equatable {
  const MyLocationEvent();
}

class MapLoaded extends MyLocationEvent {
  final Completer<GoogleMapController> controller;
  const MapLoaded({required this.controller});

  @override
  List<Object> get props => [controller];
}

class AddMarker extends MyLocationEvent {
  final Marker marker;
  const AddMarker({required this.marker});

  @override
  List<Object> get props => [marker];
}
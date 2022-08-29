import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  /// {@macro start_game_bloc}
  LocationBloc() : super(LocationState.initial()) {
    on<MapLoaded>(_onMapLoaded);
    on<AddMarker>(_onAddMarker);
  }

  void _onMapLoaded(
    MapLoaded event,
    Emitter<LocationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LocationStatus.loaded,
        controller: event.controller,
      ),
    );
  }

  void _onAddMarker(
    AddMarker event,
    Emitter<LocationState> emit,
  ) {
    final _markers = Set<Marker>();
    _markers.addAll(state.markers);
    _markers.add(event.marker);
    emit(state.copyWith(
      markers: _markers,
    ));
  }
}

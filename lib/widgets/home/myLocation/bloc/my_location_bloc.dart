import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'my_location_event.dart';
part 'my_location_state.dart';

class MyLocationBloc extends Bloc<MyLocationEvent, MyLocationState> {
  /// {@macro start_game_bloc}
  MyLocationBloc() : super(MyLocationState.initial()) {
    on<MapLoaded>(_onMapLoaded);
    on<AddMarker>(_onAddMarker);
  }

  void _onMapLoaded(
    MapLoaded event,
    Emitter<MyLocationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MyLocationStatus.loaded,
        controller: event.controller,
      ),
    );
  }

  void _onAddMarker(
    AddMarker event,
    Emitter<MyLocationState> emit,
  ) {
    final _markers = Set<Marker>();
    _markers.addAll(state.markers);
    _markers.add(event.marker);
    emit(
      state.copyWith(
        markers: _markers,
      )
    );
  }

}

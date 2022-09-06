import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  /// {@macro start_game_bloc}
  LocationBloc() : super(LocationState.initial()) {
    on<MapLoaded>(_onMapLoaded);
    on<AddMarkers>(_onAddMarkers);
    on<AddMarker>(_onAddMarker);
    on<UpdateMarker>(_onUpdateMarker);
    on<RemoveMarker>(_onRemoveMarker);
    on<AddParties>(_onAddParties);
    on<AddParty>(_onAddParty);
    on<UpdateParty>(_onUpdateParty);
    on<RemoveParty>(_onRemoveParty);
    on<SetCurrentLocation>(_onSetCurrentLocation);
    on<SetFocusedPartyId>(_onSetFocusedPartyId);
    on<SetTimer>(_onSetTimer);
    on<SetJoinedPartyId>(_onSetJoinedPartyId);
  }

  void _onSetJoinedPartyId(
    SetJoinedPartyId event,
    Emitter<LocationState> emit,
  ) {
    emit(
      state.copyWith(
        joinedPartyId: event.joinedPartyId,
      ),
    );
  }

  void _onSetTimer(
    SetTimer event,
    Emitter<LocationState> emit,
  ) {
    emit(
      state.copyWith(
        timer: event.timer,
      ),
    );
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

  void _onAddMarkers(
    AddMarkers event,
    Emitter<LocationState> emit,
  ) {
    final markers = state.markers;
    markers.addAll(event.markers);
    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }

  void _onAddMarker(
    AddMarker event,
    Emitter<LocationState> emit,
  ) {
    final markers = state.markers;
    markers.add(event.marker);
    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }

  void _onAddParties(
    AddParties event,
    Emitter<LocationState> emit,
  ) {
    final parties = state.parties;
    parties.addAll(event.parties);
    emit(
      state.copyWith(
        parties: parties,
      ),
    );
  }

  void _onAddParty(
    AddParty event,
    Emitter<LocationState> emit,
  ) {
    final parties = state.parties;
    parties.add(event.party);
    emit(
      state.copyWith(
        parties: parties,
      ),
    );
  }

  void _onSetCurrentLocation(
    SetCurrentLocation event,
    Emitter<LocationState> emit,
  ) {
    emit(
      state.copyWith(
        currentLocation: event.currentLocation,
      ),
    );
  }

  void _onUpdateMarker(
    UpdateMarker event,
    Emitter<LocationState> emit,
  ) {
    final markers = state.markers;
    markers.add(event.marker);
    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }

  void _onRemoveMarker(
    RemoveMarker event,
    Emitter<LocationState> emit,
  ) {
    final markers = state.markers;
    markers.remove(event.marker);
    emit(
      state.copyWith(
        markers: markers,
      ),
    );
  }

  void _onUpdateParty(
    UpdateParty event,
    Emitter<LocationState> emit,
  ) {
    final parties = state.parties;
    final index = parties.indexWhere((party) => party.id == event.party.id);
    if (index != -1) {
      parties[index] = event.party;
    }
    emit(
      state.copyWith(
        parties: parties,
      ),
    );
  }

  void _onRemoveParty(
    RemoveParty event,
    Emitter<LocationState> emit,
  ) {
    final parties = state.parties;
    parties.remove(event.party);
    emit(
      state.copyWith(
        parties: parties,
      ),
    );
  }

  void _onSetFocusedPartyId(
    SetFocusedPartyId event,
    Emitter<LocationState> emit,
  ) {
    emit(
      state.copyWith(
        focusedPartyId: event.focusedPartyId,
      ),
    );
  }
}

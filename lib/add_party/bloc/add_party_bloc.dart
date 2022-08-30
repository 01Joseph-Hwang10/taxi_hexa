import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_place/google_place.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'add_party_event.dart';
part 'add_party_state.dart';

class AddPartyBloc extends Bloc<AddPartyEvent, AddPartyState> {
  AddPartyBloc() : super(AddPartyState.initial()) {
    on<SetDeparture>(_onSetDeparture);
    on<SetDestinationAddress>(_onSetDestinationAddress);
    on<SetDestinationPlacemarks>(_onSetDestinationPlacemarks);
  }

  void _onSetDeparture(
    SetDeparture event,
    Emitter<AddPartyState> emit,
  ) {
    emit(
      state.copyWith(
        departure: event.departure,
      ),
    );
  }

  void _onSetDestinationAddress(
    SetDestinationAddress event,
    Emitter<AddPartyState> emit,
  ) {
    emit(
      state.copyWith(
        destination: event.destination,
      ),
    );
  }

  void _onSetDestinationPlacemarks(
    SetDestinationPlacemarks event,
    Emitter<AddPartyState> emit,
  ) {
    emit(
      state.copyWith(
        destinationPlacemarks: event.destinationPlacemarks,
      ),
    );
  }
}

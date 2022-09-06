part of 'location_bloc.dart';

enum LocationStatus {
  /// Initial status.
  initial,

  /// Map is loaded.
  loaded,
}

class LocationState extends Equatable {
  const LocationState({
    required this.status,
    required this.markers,
    required this.controller,
    required this.currentLocation,
    required this.parties,
    required this.focusedPartyId,
    required this.timer,
    required this.joinedPartyId,
  });

  /// Initial [LocationState].
  LocationState.initial()
      : this(
          status: LocationStatus.initial,
          controller: Completer(),
          markers: <Marker>{},
          currentLocation: null,
          parties: [],
          focusedPartyId: null,
          joinedPartyId: null,
          timer: null,
        );

  final LatLng? currentLocation;

  /// TODO: Move below properties to home_bloc later.
  final LocationStatus status;
  final Completer<GoogleMapController> controller;
  final Set<Marker> markers;
  final List<TaxiPartyModel> parties;
  final String? focusedPartyId;
  final String? joinedPartyId;
  final Timer? timer;

  /// Creates a copy of [LocationState].
  LocationState copyWith({
    LocationStatus? status,
    Completer<GoogleMapController>? controller,
    Set<Marker>? markers,
    LatLng? currentLocation,
    List<TaxiPartyModel>? parties,
    String? focusedPartyId,
    Timer? timer,
    String? joinedPartyId,
  }) {
    return LocationState(
      status: status ?? this.status,
      controller: controller ?? this.controller,
      markers: markers ?? this.markers,
      currentLocation: currentLocation ?? this.currentLocation,
      parties: parties ?? this.parties,
      focusedPartyId: focusedPartyId ?? this.focusedPartyId,
      timer: timer ?? this.timer,
      joinedPartyId: joinedPartyId ?? this.joinedPartyId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        controller,
        markers,
        currentLocation,
        parties,
        focusedPartyId,
        timer,
        joinedPartyId,
      ];
}

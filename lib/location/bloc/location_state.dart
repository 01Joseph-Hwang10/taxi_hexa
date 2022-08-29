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
  });

  /// Initial [LocationState].
  LocationState.initial()
      : this(
          status: LocationStatus.initial,
          controller: Completer(),
          markers: <Marker>{},
        );

  /// Status of [LocationState].
  final LocationStatus status;

  final Completer<GoogleMapController> controller;

  // ignore: prefer_collection_literals
  final Set<Marker> markers;

  /// Creates a copy of [LocationState].
  LocationState copyWith({
    LocationStatus? status,
    Completer<GoogleMapController>? controller,
    Set<Marker>? markers,
  }) {
    return LocationState(
      status: status ?? this.status,
      controller: controller ?? this.controller,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object> get props => [status, controller, markers];
}

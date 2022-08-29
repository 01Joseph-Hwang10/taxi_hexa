part of 'my_location_bloc.dart';

enum MyLocationStatus {
  /// Initial status.
  initial,

  /// Map is loaded.
  loaded,
}

class MyLocationState extends Equatable {
  MyLocationState({
    required this.status,
    required this.markers,
    required this.controller,
  });

  /// Initial [MyLocationState].
  MyLocationState.initial() : this(status: MyLocationStatus.initial, controller: Completer(), markers: Set(),);

  /// Status of [MyLocationState].
  final MyLocationStatus status;

  final Completer<GoogleMapController> controller;

  // ignore: prefer_collection_literals
  final Set<Marker> markers;

  /// Creates a copy of [MyLocationState].
  MyLocationState copyWith({
    MyLocationStatus? status,
    Completer<GoogleMapController>? controller,
    Set<Marker>? markers,
  }) {
    return MyLocationState(
      status: status ?? this.status,
      controller: controller ?? this.controller,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object> get props => [status, controller, markers];
}

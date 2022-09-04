part of 'add_party_bloc.dart';

abstract class AddPartyEvent extends Equatable {
  const AddPartyEvent();
}

class SetDeparture extends AddPartyEvent {
  final DateTime departure;
  const SetDeparture({required this.departure});

  @override
  List<Object?> get props => [departure];
}

class SetDestinationAddress extends AddPartyEvent {
  final DetailsResponse? destination;
  const SetDestinationAddress({required this.destination});

  @override
  List<Object?> get props => [destination];
}

class SetDestinationPlacemarks extends AddPartyEvent {
  final List<Placemark> destinationPlacemarks;
  const SetDestinationPlacemarks({required this.destinationPlacemarks});

  @override
  List<Object?> get props => [destinationPlacemarks];
}

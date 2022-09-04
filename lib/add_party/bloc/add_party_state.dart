part of 'add_party_bloc.dart';

class AddPartyState extends Equatable {
  const AddPartyState({
    required this.descriptionTextController,
    required this.nameTextController,
    required this.departure,
    required this.destination,
    required this.destinationPlacemarks,
    required this.googlePlace,
  });

  AddPartyState.initial()
      : this(
          descriptionTextController: TextEditingController(),
          nameTextController: TextEditingController(),
          departure: null,
          destination: null,
          destinationPlacemarks: null,
          googlePlace: dotenv.env['GOOGLE_MAPS_API_KEY'] == null
              ? null
              : GooglePlace(dotenv.env['GOOGLE_MAPS_API_KEY']!),
        );

  final TextEditingController nameTextController;
  final TextEditingController descriptionTextController;
  final DetailsResponse? destination;
  final List<Placemark>? destinationPlacemarks;
  final DateTime? departure;
  final GooglePlace? googlePlace;

  String get name => nameTextController.text;
  String get description => descriptionTextController.text;

  AddPartyState copyWith({
    TextEditingController? nameTextController,
    TextEditingController? descriptionTextController,
    DetailsResponse? destination,
    DateTime? departure,
    List<Placemark>? destinationPlacemarks,
    GooglePlace? googlePlace,
  }) {
    return AddPartyState(
      nameTextController: nameTextController ?? this.nameTextController,
      descriptionTextController:
          descriptionTextController ?? this.descriptionTextController,
      destination: destination ?? this.destination,
      departure: departure ?? this.departure,
      destinationPlacemarks:
          destinationPlacemarks ?? this.destinationPlacemarks,
      googlePlace: googlePlace ?? this.googlePlace,
    );
  }

  @override
  List<Object?> get props => [
        nameTextController,
        descriptionTextController,
        destination,
        departure,
      ];
}

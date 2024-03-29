import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/home/components/bottom_buttons/buttons/buttons.dart';
import 'package:taxi_hexa/home/components/party_info/functions/functions.dart';
import 'package:taxi_hexa/home/models/taxi_party.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/taxi_map/taxi_map.dart';
import 'package:taxi_hexa/utils/assets.dart';
import 'package:taxi_hexa/utils/constant/constant.dart';

class TaxiMap extends StatefulWidget {
  const TaxiMap({Key? key}) : super(key: key);
  @override
  State<TaxiMap> createState() => _TaxiMapState();
}

CameraPosition initialCameraPosition = const CameraPosition(
  target: unistDormitory,
  zoom: 14.4746,
);

/// See: https://medium.com/swlh/switch-to-dark-mode-in-real-time-with-flutter-and-google-maps-f0f080cd72e9
/// TODO: Implement UI by color theme (light/dark)
class _TaxiMapState extends StatefulTaxiMapListener<TaxiMap>
    with WidgetsBindingObserver {
  @override
  Widget buildWithMapUpdate(BuildContext context) {
    final bloc = context.watch<LocationBloc>();
    final state = bloc.state;
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialCameraPosition,
      markers: state.markers,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) async {
        final completer = Completer<GoogleMapController>();
        completer.complete(controller);
        final bindedController = await completer.future;
        final mapStyle = await rootBundle.loadString('assets/map/dark.json');
        await bindedController.setMapStyle(mapStyle);
        bloc.add(MapLoaded(controller: completer));
      },
    );
  }

  String? darkMapStyle;
  String? lightMapStyle;

  CurrentLocation currentLocation = const CurrentLocation();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    attachDataListeners();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await currentLocation.load(context);
    });
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      setMapStyle(context);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> setMapStyle(BuildContext context) async {
    final bloc = context.read<LocationBloc>();
    final state = bloc.state;
    final controller = await state.controller.future;
    final theme = WidgetsBinding.instance.window.platformBrightness;
    final darkMapStyle = await rootBundle.loadString('assets/map/dark.json');
    final lightMapStyle = await rootBundle.loadString('assets/map/light.json');
    if (theme == Brightness.dark) {
      controller.setMapStyle(darkMapStyle);
    } else {
      controller.setMapStyle(lightMapStyle);
    }
  }

  void attachDataListeners() {
    DatabaseReference partiesRef = FirebaseDatabase.instance.ref("parties");
    partiesRef.onChildAdded.listen(onChildAdded);
    partiesRef.onChildChanged.listen(onChildChanged);
    partiesRef.onChildRemoved.listen(onChildRemoved);
  }

  void onChildAdded(DatabaseEvent event) async {
    final locationBloc = context.read<LocationBloc>();
    final loginBloc = context.read<LoginBloc>();
    final party = TaxiPartyModel.fromJson(
      parseData(event.snapshot.value),
    );
    locationBloc.add(AddParty(party: party));
    final marker = createMarker(party);
    locationBloc.add(AddMarker(marker: marker));
    if (party.members.contains(loginBloc.state.userInfo?.id)) {
      locationBloc.add(
        SetFocusedPartyId(
          focusedPartyId: party.id,
        ),
      );
      locationBloc.add(
        SetJoinedPartyId(
          joinedPartyId: party.id,
        ),
      );
    }
    updateMap();
  }

  void onChildChanged(DatabaseEvent event) {
    final bloc = context.read<LocationBloc>();
    final party = TaxiPartyModel.fromJson(
      parseData(event.snapshot.value),
    );
    bloc.add(UpdateParty(party: party));
    final marker = createMarker(party);
    bloc.add(UpdateMarker(marker: marker));
    updateMap();
  }

  void onChildRemoved(DatabaseEvent event) {
    final bloc = context.read<LocationBloc>();
    final party = bloc.state.parties.firstWhere(
      (party) => party.id == event.snapshot.key!.replaceFirst('taxi_party', ''),
    );
    bloc.add(RemoveParty(party: party));
    final marker = bloc.state.markers.firstWhere(
      (marker) => marker.markerId == MarkerId(party.id),
    );
    bloc.add(RemoveMarker(marker: marker));
    updateMap();
  }

  /// See: https://stackoverflow.com/questions/70595225/cant-cast-internallinkedhashmapobject-object-to-anything
  ///
  /// 위와 같은 문제가 있다고 하는데 고칠 수 있는 방법이 지금은 있을 것 같은데
  /// 나는 아직 못찾음. 지금은 최적화를 생각할 상황은 아니니 일단 이렇게 해둠.
  ///
  /// TODO: 이거보다 좋은 방법이 있지 않을까?
  Map<String, dynamic> parseData(Object? value) {
    return jsonDecode(jsonEncode(value));
  }

  Marker createMarker(TaxiPartyModel party) {
    final position = LatLng(
      party.currentPosition!.latitude,
      party.currentPosition!.longitude,
    );
    final id = MarkerId(party.id);
    void onTap() {
      showPartyInfoModal(context, party);
    }

    final marker = Marker(
      markerId: id,
      position: position,
      icon: markerDefault!,
      onTap: onTap,
    );
    return marker;
  }
}

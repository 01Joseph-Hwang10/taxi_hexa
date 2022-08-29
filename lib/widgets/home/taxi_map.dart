import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/utils/constants.dart';
import 'package:taxi_hexa/widgets/home/myLocation/bloc/my_location_bloc.dart';

class TaxiMap extends StatefulWidget {
  const TaxiMap({Key? key}) : super(key: key);
  @override
  State<TaxiMap> createState() => _TaxiMapState();
}

/// See: https://medium.com/swlh/switch-to-dark-mode-in-real-time-with-flutter-and-google-maps-f0f080cd72e9
/// TODO: Implement UI by color theme (light/dark)
class _TaxiMapState extends State<TaxiMap> with WidgetsBindingObserver {

  CameraPosition initialCameraPosition = const CameraPosition(target: unistDormitory, zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MyLocationBloc>();
    final state = bloc.state;
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialCameraPosition,
      markers: state.markers,
      onMapCreated: (GoogleMapController controller) async {
        final _controller = Completer<GoogleMapController>();
        _controller.complete(controller);
        final bindedController = await _controller.future;
        final mapStyle = await rootBundle.loadString('assets/map/dark.json');
        await bindedController.setMapStyle(mapStyle);
        bloc.add(MapLoaded(controller: _controller));
      },
    );
  }

  String? _darkMapStyle;
  String? _lightMapStyle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadMapStyles();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      _setMapStyle(context);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future _setMapStyle(BuildContext context) async {
    final bloc = context.read<MyLocationBloc>();
    final state = bloc.state;
    final controller = await state.controller.future;
    final theme = WidgetsBinding.instance.window.platformBrightness;
    if (theme == Brightness.dark) {
      controller.setMapStyle(_darkMapStyle);
    } else {
      controller.setMapStyle(_lightMapStyle);
    }
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/map/dark.json');
    _lightMapStyle = await rootBundle.loadString('assets/map/light.json');
  }
}

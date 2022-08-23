import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class TaxiMap extends StatefulWidget {
  const TaxiMap({Key? key}) : super(key: key);
  @override
  State<TaxiMap> createState() => _TaxiMapState();
}

/// See: https://medium.com/swlh/switch-to-dark-mode-in-real-time-with-flutter-and-google-maps-f0f080cd72e9
/// TODO: Implement UI by color theme (light/dark)
class _TaxiMapState extends State<TaxiMap> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.57678893974687, 129.1876580155182),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
        final bindedController = await _controller.future;
        final mapStyle = await rootBundle.loadString('assets/map/dark.json');
        await bindedController.setMapStyle(mapStyle);
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
      _setMapStyle();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;
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

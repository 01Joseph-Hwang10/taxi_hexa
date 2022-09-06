import 'package:flutter/material.dart';
import 'package:taxi_hexa/taxi_map/taxi_map.dart';

abstract class StatefulTaxiMapListener<T extends StatefulWidget>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<void>(
      valueListenable: mapUpdater,
      builder: (_, __, ___) {
        return buildWithMapUpdate(context);
      },
    );
  }

  Widget buildWithMapUpdate(BuildContext context);
}

// ignore: must_be_immutable
abstract class StatelessTaxiMapListener extends StatelessWidget {
  const StatelessTaxiMapListener({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<void>(
      valueListenable: mapUpdater,
      builder: (_, __, ___) {
        return buildWithMapUpdate(context);
      },
    );
  }

  Widget buildWithMapUpdate(BuildContext context);
}

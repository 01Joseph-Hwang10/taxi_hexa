import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/bottom_buttons/buttons/buttons.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          CurrentLocationButton(),
          SizedBox(width: 5),
          AddPartyButton(),
          SizedBox(width: 5),
          RefreshButton(),
        ],
      ),
    );
  }
}

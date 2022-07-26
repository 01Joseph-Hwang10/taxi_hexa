import 'package:flutter/material.dart';
import 'package:taxi_hexa/widgets/common/absolute_align.dart';
import 'package:taxi_hexa/widgets/home/app_bar.dart';
import 'package:taxi_hexa/widgets/home/bottom_buttons.dart';

import 'package:taxi_hexa/widgets/home/taxi_map.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TaxiMap(),
        AbsoluteAlign(
          alignment: Alignment.bottomLeft,
          width: MediaQuery.of(context).size.width,
          child: const BottomButtons(),
        ),
        AbsoluteAlign(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          child: const CustomAppBar(),
        )
      ],
    );
  }
}

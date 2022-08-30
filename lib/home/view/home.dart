import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/app_bar/app_bar.dart';
import 'package:taxi_hexa/home/home.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const TaxiMap(),
          AbsoluteAlign(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            child: const BottomButtons(),
          ),
          AbsoluteAlign(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            child: const CustomAppBar(),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
            child: const BottomButtons(),
          ),
          AbsoluteAlign(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            child: const CustomAppBar(),
          )
        ],
      ),
    );
  }
}

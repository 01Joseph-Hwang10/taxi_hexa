import 'package:flutter/material.dart';
import 'package:taxi_hexa/widgets/home/app_bar.dart';
import 'package:taxi_hexa/widgets/home/bottom_buttons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      bottomNavigationBar: const BottomButtons(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taxi_hexa/widgets/home/bottom_buttons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black, //-----------------------removable
      bottomNavigationBar: BottomButtons(),
    );
  }
}

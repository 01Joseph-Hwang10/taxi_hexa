import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/app_bar/buttons/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          MenuButton(),
          ProfileButton(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/themes/colors.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCircleButton(
      icon: Icons.sync,
      backgroundColor: AppColors.blue,
      borderColor: AppColors.white,
      onPressed: () => {},
    );
  }
}

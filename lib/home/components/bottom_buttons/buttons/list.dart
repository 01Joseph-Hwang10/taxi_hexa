import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/themes/colors.dart';

class ListButton extends StatelessWidget {
  const ListButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCircleButton(
      icon: Icons.list_alt_rounded,
      backgroundColor: AppColors.blue,
      borderColor: AppColors.white,
      onPressed: () => {},
    );
  }
}

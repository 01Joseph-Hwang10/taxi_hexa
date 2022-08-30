import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';

class CupertinoBackButton extends StatelessWidget {
  const CupertinoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).maybePop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_rounded,
        color: AppColors.blue,
        size: 30,
      ),
    );
  }
}

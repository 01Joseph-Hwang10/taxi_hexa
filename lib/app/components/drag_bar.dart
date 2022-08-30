import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';

class DragBar extends StatelessWidget {
  const DragBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 10,
        width: 100,
        decoration: const BoxDecoration(
          color: AppColors.darkblue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

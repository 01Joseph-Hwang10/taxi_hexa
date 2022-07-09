import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/widgets/common/elevated_circle_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: const Color.fromARGB(0, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedCircleButton(
              icon: Icons.gps_fixed,
              backgroundColor: AppColors.col2,
              borderColor: AppColors.col1,
              onPressed: () => {},
            ),
            ElevatedCircleButton(
              icon: Icons.add,
              backgroundColor: AppColors.col2,
              borderColor: AppColors.col1,
              onPressed: () => {},
            ),
            ElevatedCircleButton(
              icon: Icons.sync,
              backgroundColor: AppColors.col2,
              borderColor: AppColors.col1,
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}

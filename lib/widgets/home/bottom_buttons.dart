import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/widgets/common/elevated_circle_button.dart';
import 'package:taxi_hexa/widgets/home/add.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedCircleButton(
            icon: Icons.gps_fixed,
            backgroundColor: AppColors.col2,
            borderColor: AppColors.col1,
            onPressed: () => {},
          ),
          const SizedBox(width: 5),
          ElevatedCircleButton(
            icon: Icons.add,
            backgroundColor: AppColors.col2,
            borderColor: AppColors.col1,
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  builder: (BuildContext context) {
                    return AddParty();
                  });
            },
          ),
          const SizedBox(width: 5),
          ElevatedCircleButton(
            icon: Icons.sync,
            backgroundColor: AppColors.col2,
            borderColor: AppColors.col1,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}

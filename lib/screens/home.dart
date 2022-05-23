import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/widgets/common/elevated_circle_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //-----------------------removable
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color.fromARGB(0, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              elevatedCircleButton(
                  Icons.gps_fixed, AppColors.col2, AppColors.col1, () => {}),
              elevatedCircleButton(
                  Icons.add, AppColors.col2, AppColors.col1, () => {}),
              elevatedCircleButton(
                  Icons.sync, AppColors.col2, AppColors.col1, () => {}),
            ],
          ),
        ),
      ),
    );
  }
}

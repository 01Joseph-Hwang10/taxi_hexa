import 'package:flutter/material.dart';
import 'package:taxi_hexa/add_party/view/view.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/themes/colors.dart';

class AddPartyButton extends StatelessWidget {
  const AddPartyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCircleButton(
      icon: Icons.add,
      backgroundColor: AppColors.blue,
      borderColor: AppColors.white,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          builder: (_) => const AddParty(),
        );
      },
    );
  }
}

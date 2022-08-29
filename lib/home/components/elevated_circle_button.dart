import 'package:flutter/material.dart';

class ElevatedCircleButton extends StatelessWidget {
  const ElevatedCircleButton(
      {Key? key,
      required this.icon,
      required this.backgroundColor,
      required this.borderColor,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: backgroundColor,
      padding: const EdgeInsets.all(15.0),
      shape: CircleBorder(
        side: BorderSide(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Icon(
        icon,
        size: 35.0,
        color: borderColor,
      ),
    );
  }
}

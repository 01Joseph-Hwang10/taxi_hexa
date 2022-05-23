import 'package:flutter/material.dart';

RawMaterialButton ElevatedCircleButton(
  IconData icon,
  Color backgroundColor,
  Color borderColor,
  onPressed,
) =>
    (RawMaterialButton(
        onPressed: () => onPressed(),
        elevation: 2.0,
        fillColor: backgroundColor,
        padding: const EdgeInsets.all(15.0),
        shape: CircleBorder(side: BorderSide(color: borderColor, width: 1.5)),
        child: Icon(icon, size: 35.0, color: borderColor)));

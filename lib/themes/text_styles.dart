import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 20,
    color: Colors.black87,
  );
}

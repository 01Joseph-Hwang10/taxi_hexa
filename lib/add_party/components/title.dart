import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/text_styles.dart';

class ModalTitle extends StatelessWidget {
  const ModalTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "택시팟 생성",
      textAlign: TextAlign.start,
      style: AppTextStyles.heading,
    );
  }
}

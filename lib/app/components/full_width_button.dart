import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/text_styles.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton(
    this.text, {
    Key? key,
    bool? dense,
    bool? disabled,
    this.color,
    this.onPressed,
  })  : dense = dense ?? false,
        disabled = disabled ?? false,
        super(key: key);

  final void Function()? onPressed;
  final Color? color;
  final String text;
  final bool dense;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size.fromHeight(dense ? 30 : 50),
      ),
      child: Text(
        text,
        style: AppTextStyles.subHeading,
        textAlign: TextAlign.center,
      ),
    );
  }
}

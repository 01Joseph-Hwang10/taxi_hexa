import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    bool? disabled,
    this.onPressed,
    this.backgroundColor,
    this.child,
  })  : disabled = disabled ?? false,
        super(key: key);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? AppColors.blue,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.5),
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}

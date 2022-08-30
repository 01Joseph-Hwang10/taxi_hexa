import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';

class CupertinoTextField extends StatelessWidget {
  const CupertinoTextField({
    Key? key,
    bool? dense,
    bool? required,
    required this.controller,
    required this.fieldName,
  })  : dense = dense ?? false,
        required = required ?? false,
        super(key: key);

  final TextEditingController controller;
  final String fieldName;
  final bool dense;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: buildInputDecoration(fieldName: fieldName),
      controller: controller,
    );
  }

  String? get _errorText {
    if (required && controller.text.isEmpty) {
      return '필수인 항목입니다.';
    }
    return null;
  }

  InputDecoration buildInputDecoration({
    required String fieldName,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusColor: AppColors.blue,
      hintText: fieldName,
      errorText: _errorText,
    );
  }
}

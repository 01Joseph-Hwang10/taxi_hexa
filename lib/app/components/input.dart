// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:taxi_hexa/themes/colors.dart';

class CupertinoTextField extends StatefulWidget {
  const CupertinoTextField({
    Key? key,
    bool? dense,
    bool? required,
    bool? password,
    required this.controller,
    required this.fieldName,
  })  : dense = dense ?? false,
        required = required ?? false,
        password = password ?? false,
        super(key: key);

  final TextEditingController controller;
  final String fieldName;
  final bool dense;
  final bool required;
  final bool password;

  @override
  _CupertinoTextFieldState createState() => _CupertinoTextFieldState();
}

class _CupertinoTextFieldState extends State<CupertinoTextField> {
  String? errorText;
  void setErrorText(String? text) {
    setState(() {
      errorText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: buildInputDecoration(fieldName: widget.fieldName),
      controller: widget.controller,
      obscureText: widget.password,
      enableSuggestions: !widget.password,
      autocorrect: !widget.password,
      onChanged: (value) {
        if (!widget.required) return;
        if (value.isEmpty && errorText == null) {
          setErrorText("필수 입력 항목입니다");
          return;
        }
        if (value.isNotEmpty && errorText != null) {
          setErrorText(null);
          return;
        }
      },
    );
  }

  InputDecoration buildInputDecoration({
    required String fieldName,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusColor: AppColors.blue,
      hintText: fieldName,
      errorText: errorText,
    );
  }
}

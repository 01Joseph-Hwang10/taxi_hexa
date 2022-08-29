import 'package:flutter/material.dart';

abstract class AbstractForm extends StatelessWidget {
  AbstractForm({Key? key}) : super(key: key);

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  String get email => emailTextController.text;
  String get password => passwordTextController.text;

  @override
  Widget build(BuildContext context);

  AppBar buildAppBar() {
    return AppBar(
      leading: const BackButton(),
    );
  }

  /// TODO: Do styling
  Widget buildForm(
    BuildContext context, {
    required String title,
    required void Function() onSubmit,
  }) {
    return Column(
      children: <Widget>[
        Text(title),
        TextFormField(
          decoration: buildInputDecoration(hintText: 'E-mail'),
          controller: emailTextController,
        ),
        TextFormField(
          decoration: buildInputDecoration(hintText: 'Password'),
          controller: passwordTextController,
        ),
        TextButton(
          onPressed: onSubmit,
          child: Text(title),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration({
    required String hintText,
  }) {
    return InputDecoration(
      hintText: hintText,
    );
  }
}

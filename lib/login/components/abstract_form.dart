import 'package:flutter/material.dart';
import 'package:taxi_hexa/app/components/components.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/themes/text_styles.dart';

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
      leading: const CupertinoBackButton(),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget buildFormContainer(
    BuildContext context, {
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  List<Widget> buildFormElements(
    BuildContext context, {
    required String title,
    required void Function() onSubmit,
  }) {
    final height = MediaQuery.of(context).size.height;
    return [
      SizedBox(height: height * 0.1),
      // Logo
      Image.asset(
        'assets/icons/taxi-hexa-logo.png',
        width: 300,
      ),
      const SizedBox(height: 20),
      // Title
      Text(
        title,
        style: AppTextStyles.heading,
      ),
      const SizedBox(height: 15),
      // Email
      CupertinoTextField(
        fieldName: 'E-mail',
        controller: emailTextController,
      ),
      const SizedBox(height: 5),
      // Password
      CupertinoTextField(
        fieldName: 'Password',
        controller: passwordTextController,
      ),
      const SizedBox(height: 15),
      // Submit
      FullWidthButton(
        title,
        onPressed: onSubmit,
        color: AppColors.blue,
      ),
    ];
  }
}

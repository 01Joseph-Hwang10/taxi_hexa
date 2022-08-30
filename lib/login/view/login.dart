// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_hexa/login/components/components.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/login/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends AbstractForm {
  Login({
    Key? key,
  }) : super(key: key);

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final formElements = buildFormElements(
      context,
      title: 'Login',
      onSubmit: () => login(context),
    );
    formElements.addAll(
      [
        const SizedBox(height: 10),
        const _GotoSignUp(),
      ],
    );
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: buildFormContainer(
          context,
          children: formElements,
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    try {
      final newUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser.user == null) throw Exception("User not found");
      final bloc = context.read<LoginBloc>();
      bloc.add(
        LoggedIn(
          UserModel(
            id: newUser.user!.uid,
            name: newUser.additionalUserInfo?.username ??
                newUser.user!.displayName ??
                email,
          ),
        ),
      );
      Navigator.of(context).maybePop();
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }
}

class _GotoSignUp extends StatelessWidget {
  const _GotoSignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Have no account?'),
        TextButton(
          onPressed: () => gotoSignUp(context),
          child: const Text('Sign up'),
        ),
      ],
    );
  }

  void gotoSignUp(BuildContext context) {
    Navigator.of(context).pushNamed('/signup');
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_hexa/login/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/login/models/user.dart';

class SignIn extends AbstractForm {
  SignIn({
    Key? key,
  }) : super(key: key);

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: buildForm(
          context,
          title: 'Sign In',
          onSubmit: () => _signin(context),
        ),
      ),
    );
  }

  void _signin(BuildContext context) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (newUser.user == null) throw Exception("User not created");
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
        builder: (_) => Text(e.toString()),
      );
    }
  }
}

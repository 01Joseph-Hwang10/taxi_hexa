// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_hexa/login/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/login/models/user.dart';

/// I misspelled this class name. It's 'SignUp' not 'SignIn'.
class SignUp extends AbstractForm {
  SignUp({
    Key? key,
  }) : super(key: key);

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Center(
          child: buildFormContainer(
            context,
            children: buildFormElements(
              context,
              title: 'Sign Up',
              onSubmit: () => signup(context),
            ),
          ),
        ),
      ),
    );
  }

  void signup(BuildContext context) async {
    try {
      final credential =
          EmailAuthProvider.credential(email: email, password: password);
      final newUser = await FirebaseAuth.instance.currentUser
          ?.linkWithCredential(credential);
      if (newUser!.user == null) throw Exception("User not created");
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

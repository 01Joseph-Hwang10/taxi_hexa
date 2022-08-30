import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:taxi_hexa/login/login.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle_rounded),
      color: Colors.white,
      iconSize: 30,
      onPressed: () {
        final isLoggedIn = context.read<LoginBloc>().state.isLoggedIn;
        if (!isLoggedIn) {
          Navigator.of(context).pushNamed('/login');
        } else {
          /// TODO: Do styling
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              title: Text('You are already logged in!'),
            ),
          );
        }
      },
    );
  }
}

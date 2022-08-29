import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/login/login.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _MenuButton(),
          _ProfileButton(),
        ],
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  const _ProfileButton({
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

class _MenuButton extends StatelessWidget {
  const _MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      color: Colors.white,
      iconSize: 30,
      onPressed: () {
        /// TODO: Do styling
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('No menu to show!'),
          ),
        );
      },
    );
  }
}

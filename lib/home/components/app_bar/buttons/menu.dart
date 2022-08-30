import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
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

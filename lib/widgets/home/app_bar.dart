import 'package:flutter/material.dart';

/// [AppBar]가 [PreferredSizeWidget]을 상속받아야해
/// [AppBar]에 한해서는 아래와 같은 위젯 implementation이 필요함.
class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        );
}

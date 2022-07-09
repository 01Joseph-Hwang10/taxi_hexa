import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('login'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'e-mail adress',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('login btn'),
            ),
            SizedBox(
              height: 50,
            ),
            Text('sign up'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'user name',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'e-mail adress',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('signup btn'),
            ),
          ],
        ),
      ),
    );
  }
}

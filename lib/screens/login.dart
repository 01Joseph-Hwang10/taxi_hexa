import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;

  String loginUserEmail = '';

  String loginUserPw = '';

  String userEmail = '';

  String userPw = '';

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
              onSaved: (value) {
                loginUserEmail = value!;
              },
              onChanged: (value) {
                loginUserEmail = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'password',
              ),
              onSaved: (value) {
                loginUserPw = value!;
              },
              onChanged: (value) {
                loginUserPw = value;
              },
            ),
            TextButton(
              onPressed: () => _login(),
              child: const Text('login btn'),
            ),
            SizedBox(
              height: 50,
            ),
            Text('sign up'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'e-mail adress',
              ),
              onSaved: (value) {
                userEmail = value!;
              },
              onChanged: (value) {
                userEmail = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'password',
              ),
              onSaved: (value) {
                userPw = value!;
              },
              onChanged: (value) {
                userPw = value;
              },
            ),
            TextButton(
              onPressed: () => _signup(),
              child: const Text('signup btn'),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: loginUserEmail, password: loginUserPw);
      if (newUser.user != null) {
        Navigator.maybePop(context);
      }
    } catch (e) {}
  }

  void _signup() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPw);
      if (newUser.user != null) {
        Navigator.maybePop(context);
      }
    } catch (e) {}
  }
}

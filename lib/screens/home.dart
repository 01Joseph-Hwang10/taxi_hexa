import 'package:flutter/material.dart';
import 'package:taxi_hexa/screens/login.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/widgets/common/elevated_circle_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_hexa/widgets/home/app_bar.dart';
import 'package:taxi_hexa/widgets/home/bottom_buttons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    print('init');
    super.initState();
    getUser();
  }

  void getUser() {
    try {
      final uuser = _auth.currentUser;
      if (uuser != null) {
        setState(() {
          loggedUser = uuser;
        });
        print(loggedUser!.email);
        print('a');
      } else {
        print('null');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      bottomNavigationBar: const BottomButtons(),
    );
  }
}

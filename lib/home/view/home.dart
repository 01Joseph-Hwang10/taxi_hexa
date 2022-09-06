import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_hexa/home/components/app_bar/app_bar.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/login/models/user.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    attachPostFrameCallback(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const TaxiMap(),
          AbsoluteAlign(
            alignment: Alignment.bottomLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            child: const BottomButtons(),
          ),
          AbsoluteAlign(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            safearea: true,
            child: const CustomAppBar(),
          )
        ],
      ),
    );
  }

  void attachPostFrameCallback(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final currentUser = await FirebaseAuth.instance.signInAnonymously();
      bloc.add(
        LoggedIn(
          UserModel(
            id: currentUser.user!.uid,
            name: "Anonymous",
          ),
        ),
      );
    });
  }
}

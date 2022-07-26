import 'package:flutter/material.dart';
import 'package:taxi_hexa/screens/login.dart';
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
      }
    } catch (e) {
      /// TODO: Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TaxiMap(),
        AbsoluteAlign(
          alignment: Alignment.bottomLeft,
          width: MediaQuery.of(context).size.width,
          child: const BottomButtons(),
        ),
        AbsoluteAlign(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          child: const CustomAppBar(),
        )
      ],
    );
  }

  void openLoginPage() async {
    // 로그인 창 띄우는 버튼
    // 로그인 된 상태일 땐 로그아웃 버튼으로 변함(else문 내용)
    // 이를 원치 않을 땐 나중에 수정하기.
    if (loggedUser == null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
      getUser();
    } else {
      _auth.signOut();
      setState(() {
        loggedUser = null;
      });
    }
  }
}

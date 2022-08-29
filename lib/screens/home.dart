import 'package:flutter/material.dart';
import 'package:taxi_hexa/widgets/common/absolute_align.dart';
import 'package:taxi_hexa/widgets/home/app_bar.dart';
import 'package:taxi_hexa/widgets/home/bottom_buttons/bottom_buttons.dart';
import 'package:taxi_hexa/widgets/home/taxi_map.dart';
import '../widgets/common/absolute_align.dart';

import 'package:taxi_hexa/widgets/home/taxi_map.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: MainScreen(),
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
}

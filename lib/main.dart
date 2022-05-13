import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:taxi_hexa/screens/home.dart';
import 'package:taxi_hexa/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taxi HeXA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/login', page: () => const Login()),
      ],
    );
  }
}

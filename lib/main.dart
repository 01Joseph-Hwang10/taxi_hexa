import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:taxi_hexa/screens/home.dart';
import 'package:taxi_hexa/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        GetPage(name: '/login', page: () => Login()),
      ],
    );
  }
}

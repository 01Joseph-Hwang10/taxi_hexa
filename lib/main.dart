import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Taxi HeXA',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => const Login(),
      },
      initialRoute: '/',
    );
  }
}

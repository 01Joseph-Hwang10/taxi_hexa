import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Taxi HeXA',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => Login(),
      },
      initialRoute: '/',
    );
  }
}

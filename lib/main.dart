import 'package:flutter/material.dart';
import 'package:taxi_hexa/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_hexa/login/login.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  currentuser = await FirebaseAuth.instance.signInAnonymously();
  runApp(const App());
}

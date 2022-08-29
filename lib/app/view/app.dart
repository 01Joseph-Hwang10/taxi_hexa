import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/login/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationBloc()),
        BlocProvider(create: (_) => LoginBloc())
      ],
      child: MaterialApp(
        title: 'Taxi HeXA',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routes: {
          '/': (context) => const Home(),
          '/login': (context) => Login(),
        },
        initialRoute: '/',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_hexa/add_party/bloc/add_party_bloc.dart';
import 'package:taxi_hexa/add_party/components/find_address/find_address.dart';
import 'package:taxi_hexa/app/routes/routes.dart';
import 'package:taxi_hexa/location/location.dart';
import 'package:taxi_hexa/home/home.dart';
import 'package:taxi_hexa/login/login.dart';
import 'package:taxi_hexa/themes/colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocationBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => AddPartyBloc()),
      ],
      child: MaterialApp(
        title: 'Taxi HeXA',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        color: AppColors.white,
        routes: {
          AppRoutes.root: (context) => const Home(),
          AppRoutes.login: (context) => Login(),
          AppRoutes.signup: (context) => SignUp(),
          AppRoutes.findAddress: (context) => const FindAddress(),
        },
        initialRoute: '/',
      ),
    );
  }
}

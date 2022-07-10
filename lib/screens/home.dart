import 'package:flutter/material.dart';
import 'package:taxi_hexa/screens/login.dart';
import 'package:taxi_hexa/themes/colors.dart';
import 'package:taxi_hexa/widgets/common/elevated_circle_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    print('init');
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
        print(loggedUser!.email);
        print('a');
      } else {
        print('null');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //-----------------------removable
      body: Center(
        child: Column(
          children: [
            ElevatedCircleButton(
              onPressed: () {
                if (loggedUser == null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      )).then((_) {
                    print('then');
                    getUser();
                  });
                } else {
                  _auth.signOut();
                  setState(() {
                    loggedUser = null;
                  });
                }
              },
              icon: (loggedUser != null) ? Icons.exit_to_app : Icons.person,
              backgroundColor: AppColors.col2,
              borderColor: AppColors.col1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color.fromARGB(0, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedCircleButton(
                  icon: Icons.gps_fixed,
                  backgroundColor: AppColors.col2,
                  borderColor: AppColors.col1,
                  onPressed: () => {}),
              ElevatedCircleButton(
                  icon: Icons.add,
                  backgroundColor: AppColors.col2,
                  borderColor: AppColors.col1,
                  onPressed: () => {}),
              ElevatedCircleButton(
                  icon: Icons.sync,
                  backgroundColor: AppColors.col2,
                  borderColor: AppColors.col1,
                  onPressed: () => {}),
            ],
          ),
        ),
      ),
    );
  }
}

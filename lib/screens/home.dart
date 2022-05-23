import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //-----------------------removable
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: const Color.fromARGB(0, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 23, 0, 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {}, //==================================
                elevation: 2.0,
                fillColor: const Color(0xFF205375),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(
                    side: BorderSide(color: Color(0xFFEFEFEF), width: 1.5)),
                child: const Icon(
                  Icons.gps_fixed,
                  size: 35.0,
                  color: Color(0xFFEFEFEF),
                ),
              ),
              RawMaterialButton(
                onPressed: () {}, //===================================
                elevation: 2.0,
                fillColor: const Color(0xFF205375),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(
                    side: BorderSide(color: Color(0xFFEFEFEF), width: 1.5)),
                child: const Icon(
                  Icons.question_mark,
                  size: 35.0,
                  color: Color(0xFFEFEFEF),
                ),
              ),
              RawMaterialButton(
                onPressed: () {}, //======================================
                elevation: 2.0,
                fillColor: const Color(0xFF205375),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(
                    side: BorderSide(color: Color(0xFFEFEFEF), width: 1.5)),
                child: const Icon(
                  Icons.refresh_sharp,
                  size: 35.0,
                  color: Color(0xFFEFEFEF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

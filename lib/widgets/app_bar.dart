import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeXA_TAXI',
      home: Map(),
    
      
    );
  }
}


class Map extends StatelessWidget {
  const Map({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        actions: [
          IconButton(icon: Icon(Icons.account_circle), onPressed: null),
          //IconButton(icon: Icon(Icons.image), onPressed: null),
          //IconButton(icon: Icon(Icons.navigate_next), onPressed: null),
        ],
      ),
      /*
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0 0.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/flutter_practice.png'),
            )
          ],
          ),
        ),
        */
    );
  }
}


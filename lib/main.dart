//a sample tic tac toe game in flutter 
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/HomeScreens.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

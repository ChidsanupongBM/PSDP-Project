import 'package:massage/units/mainPage.dart';
import 'package:massage/screens/welcomePage.dart';
import 'package:massage/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(massage());
}

class massage extends StatelessWidget {
  const massage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/units/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/user.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                padded(const SearchBar())
              ]),
        )),
      ),
    );
  }
}

Widget padded(Widget widget) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25),
    child: widget,
  );
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:massage/common_widgets/app_button.dart';
import 'home/home_screen.dart';
import 'login/login_creen.dart';
import 'login/register_screen.dart';
import 'package:massage/screens/dashboard/button_navigator.dart';
import 'package:massage/screens/dashboard/button_navigator.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              // Image.network(
              //   'https://i.ibb.co/3MLGsSx/logo-new.png',
              //   height: 80,
              //   width: 120,
              // ),
              Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_DnLK6k.json',
                  height: 300,
                  width: 600),
              Text(
                'TOOP TUB',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                flex: 0,
                child: Text(
                  'Login to your account',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      // height: 1.5,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 3.3,
                          vertical: 20)
                      // padding: EdgeInsets.only(
                      //     left: 120, right: 120, top: 20, bottom: 20),
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftPop,
                            child: loginScreen(),
                            // child: DashboardScreen(),
                            childCurrent: welcomeScreen()));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Text(
                    'Login Now',
                    style: TextStyle(fontSize: 17),
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 4.3,
                          vertical: 20)
                      // padding: EdgeInsets.only(
                      //     left: 120, right: 120, top: 20, bottom: 20),
                      ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftPop,
                            // child: loginScreen(),
                            child: buttonNavigator(),
                            childCurrent: welcomeScreen()));
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => loginScreen()));
                  },
                  child: Text(
                    'Go to Home Page.',
                    style: TextStyle(fontSize: 17),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have\'t any account?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  signUpScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Get Started",
      fontWeight: FontWeight.w600,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return buttonNavigator();
      },
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:win/screens/home.dart';
import 'package:win/screens/login_sign_up/welcome_screen.dart';

import '../screens/home.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool isloggedin = false;
     if (isloggedin) {
       return HomeScreen();
     }
     else{
       return WelcomeScreen();
     }
  }
}

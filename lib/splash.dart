import 'package:flutter/material.dart';
import 'package:win/screens/login_sign_up/welcome_screen.dart';
import 'package:lottie/lottie.dart';
import '/theme.dart';

void main() {
  runApp(Splash());
}


void setState(Null Function() param0) {
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash>{
  // var splash = 'assets/splash.gif';

  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  build(context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.system,
      home: Scaffold(
          body: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                // mainAxisAlignment: MainAxisAlignment.center,
                child:
                  // Container(height: 10),
                  Lottie.asset('assets/splash.json',
                    fit: BoxFit.fill, repeat: false),

              )
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

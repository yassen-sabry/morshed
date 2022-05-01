
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:win/screens/home.dart';
import 'package:win/screens/login_sign_up/two_buttons.dart';
import 'package:win/screens/screens.dart';
import 'package:win/theme.dart';
import 'pages/forgot_password_page.dart';
import 'pages/login_page.dart';
import 'pages/new_account_page.dart';
import 'pages/reset_password_page.dart';
import 'splash.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.lightBlueAccent));
  WidgetsFlutterBinding.ensureInitialized();
    if(Platform.isAndroid){
      await Firebase.initializeApp();
    } if(Platform.isWindows){
      await Firebase.initializeApp(options: FirebaseOptions(
          apiKey: "AIzaSyDcuQiQdSTRTmJbbJpCPD2V_WKUQ4ia-2g",
          authDomain: "learn-gate-c8b01.firebaseapp.com",
          projectId: "learn-gate-c8b01",
          storageBucket: "learn-gate-c8b01.appspot.com",
          messagingSenderId: "1088362444533",
          appId: "1:1088362444533:web:2c18c3e6fdf5b63a1f37bc",
          measurementId: "G-HVVVS9VBL5"));
    }
  final client = StreamChatClient("xe7pkesmb3ku");
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);

  // This widget is the root of your application.
  final StreamChatClient client;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.system,
      title: 'Chatter',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: child!
          );
      },
      routes: {
        '/': (context) => Splash(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => Login_page(),

        '/forgot': (context) => Forgot(),

        '/create': (context) => Create_account_page(),

        '/home': (context) => HomeScreen(),

        '/reset': (context) => Reset_page(),

        '/two': (context) => TwoButtons(),

        // '/search': (context) => Search(),
      },
    );
  }
}

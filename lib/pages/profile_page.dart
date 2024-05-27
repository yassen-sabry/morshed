import 'package:flutter/material.dart';
import 'package:win/models/user_model.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _profileState();
}

class _profileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Text('hello')
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

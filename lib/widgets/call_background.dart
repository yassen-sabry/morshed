import 'package:flutter/material.dart';

class background extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient
            (colors: [Colors.black87, Colors.blueGrey], begin: Alignment.topLeft, end: Alignment.bottomRight)),);
  }
}

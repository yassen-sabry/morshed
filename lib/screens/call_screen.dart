// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/call_background.dart';
import 'package:unicons/unicons.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 260,
              ),
              Text(
                'Saddam Hussin',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Container(
                  height: 300,
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    direction: Axis.vertical,
                    children: [
                      FloatingActionButton.large(
                        onPressed: () {},
                        backgroundColor: Colors.black45,
                        child: Icon(UniconsLine.microphone_slash),
                      ),
                      FloatingActionButton.large(
                        onPressed: () {},
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.add),
                      ),
                      FloatingActionButton.large(
                        onPressed: () {},
                        backgroundColor: Colors.black45,
                        child: Icon(UniconsLine.volume),
                      ),
                      FloatingActionButton.large(
                        onPressed: () {},
                        backgroundColor: Colors.black45,
                        child: Icon(UniconsLine.airplay),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.large(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: Colors.red,
                  child: Icon(Icons.phone),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '/theme.dart';

void main() {
  runApp(Forgot());
}

class Forgot extends StatelessWidget {
  build(context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.system,
      home: Scaffold(
          appBar: AppBar(
            // title: Text('Back', style: TextStyle(color: Colors.black,),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0.0,
            bottomOpacity: 0.0,
          ),
          body: Padding(
        padding: EdgeInsets.all(16),
         child: Column(
            children: [
              Container(height: 80),
              Text('Remember your fucken password', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
            ],
            )
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

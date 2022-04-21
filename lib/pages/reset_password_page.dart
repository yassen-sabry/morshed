import 'package:flutter/material.dart';
import '/pages/login_page.dart';
import '/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(Reset_page());
}

class Reset_page extends StatefulWidget {

  @override
  State<Reset_page> createState() => _Reset_pageState();
}

class _Reset_pageState extends State<Reset_page> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String? errorMessage;

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
          body: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Reset Your Password', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                    Container(height: 120),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(100.0),
                            ),
                          ),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.mail)
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('Please Enter Your Email');
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    Container(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        reset(emailController.text);
                        showDialog(context: context, builder: (context)=> AlertDialog(
                          title: Text('Check Your Email'),
                        ));
                      },
                      child: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // <-- Radius
                        ),
                        minimumSize: Size(100, 40),// Background color
                      ),
                    ),
                  ],
                )
              )
          )
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void reset(String email) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .sendPasswordResetEmail(email: email)
            .then((value) => {
          showDialog(context: context, builder: (context)=> AlertDialog(
          title: Text('Check Your Email'),
            content: Text(''),
          )),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login_page()))
        })
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}

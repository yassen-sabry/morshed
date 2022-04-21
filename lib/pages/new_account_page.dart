import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 import '../screens/home_screen.dart';
import '../screens/login_sign_up/sign_up_student.dart';
import '../models/user_model.dart';
import '../theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Create_account_page());
}

class Create_account_page extends StatefulWidget {
  @override
  _Create_account_pageState createState() => _Create_account_pageState();
}

class _Create_account_pageState extends State<Create_account_page> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final confirm_passwordController = new TextEditingController();


  final _auth = FirebaseAuth.instance;
  String? errorMessage;


  build(context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          // title: Text('Back', style: TextStyle(color: Colors.black,),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
          bottomOpacity: 0.0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 120),

                Text(
                  "Register Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 13,),
                const Text(
                    "Complete your details or continue",
                    style: TextStyle(),
                    textAlign: TextAlign.center
                ),
                const Text(
                  "with social media",
                  style: TextStyle(),
                ),

                Container(height: 80),

                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.account_circle_rounded)
                  ),
                  controller: usernameController,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{3,30}$');
                    if (value!.isEmpty) {
                      return ("Username cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Sorry, but your username should be between 3 and 30 characters long");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    usernameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                ),

                Container(height: 10),

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

                Container(height: 10),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key)
                  ),
                  controller: passwordController,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{8,}$');
                    if (value!.isEmpty) {
                      return ("Password is required for login");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Password(Min. 8 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passwordController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                ),

                Container(height: 10),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(100.0),
                        ),
                      ),
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.vpn_key)
                  ),
                  controller: confirm_passwordController,
                  validator: (value) {
                    if (confirm_passwordController.text !=
                        passwordController.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirm_passwordController.text = value!;
                  },
                  textInputAction: TextInputAction.done,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        signUp(emailController.text, passwordController.text);
                      },
                      child: const Text('Create'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // <-- Radius
                        ),// Background color
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Already have an Accout?", style: TextStyle(color: Color(0xFF3B76F6),)),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text('SignIn', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3B76F6),)),
                    ),
                  ],
                ),

                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
            )],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
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

    postDetailsToFirestore() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      User? user = _auth.currentUser;
      UserModel userModel = UserModel();
      userModel.email = user!.email;
      userModel.uid = user.uid;
      userModel.username = usernameController.text;

      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(userModel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully :) ");

      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
    }
  }


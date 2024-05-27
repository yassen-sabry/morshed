import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Login_page());
}

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController searchController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  build(context) {
    return MaterialApp(
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.system,
      home: Scaffold(
          appBar: AppBar(title: const Text("Sign in"), leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.of(context).pop(),
      ),),

        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: 17,),
                    const Text(
                        "Sign in with your email and password ",
                        style: TextStyle(),
                        textAlign: TextAlign.center
                    ),
                    const Text(
                      "or continue with social media",
                      style: TextStyle(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 70),
                      child: Image.asset("assets/images/Morsheds.png", fit: BoxFit.fill,scale: 7,),
                    ),
                    Container(height: 60),
                    // Text('Proceed with your', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(100.0),
                          ),
                        ),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.mail,),
                      ),
                      controller: emailController,
                      validator: (value){
                        if (value!.isEmpty) {
                          return('Please Enter Your Email');
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value){
                        emailController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                    ),

                    Container(height: 10),

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(100.0),
                          ),
                        ),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_rounded,)
                      ),
                      controller: passwordController,
                      validator: (value){
                        RegExp regex = new RegExp(r'^.{8,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 8 Character)");
                        }
                        return null;
                      },
                      onSaved: (value){
                        passwordController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_formKey) {
                        signIn(emailController.text, passwordController.text);
                      },
                    ),

                        TextButton(
                          onPressed: (){
                            // Navigator.of(context).pushNamed('/forgot');
                              Navigator.of(context).pushNamed('/reset');
                          },
                          child: Text('Forgot Password ?', style: TextStyle(color: Color(0xFF3B76F6),)),

                        ),

                    ElevatedButton(
                      onPressed: () async {
                         signIn(emailController.text, passwordController.text);
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // <-- Radius
                        ),// Background color
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Don't have an Accout?", style: TextStyle(color: Color(0xFF3B76F6),)),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed('/two');
                          },
                          child: Text('SignUp', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3B76F6),)),
                        ),
                      ],
                    )
                  ],
            ),
          ),
          ),],
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
  void signIn(String email, String password) async{
    if(_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password)
            .then((uid) =>
        {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false),
                });
      }on FirebaseAuthException catch (error) {
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
    }}
}
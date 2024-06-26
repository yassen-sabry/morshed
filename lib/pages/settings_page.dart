import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unicons/unicons.dart';
import 'package:win/screens/login_sign_up/welcome_screen.dart';
import 'package:win/theme.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: const Text("Settings"),
      // ),
      body: const BodySettings(),
    );
  }
}



class BodySettings extends StatefulWidget {


  const BodySettings({Key? key}) : super(key: key);

  @override
  State<BodySettings> createState() => _BodySettingsState();
}

class _BodySettingsState extends State<BodySettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            ProfilePic(),
            const SizedBox(
              height: 20,
            ),
            ProfileMenu(
              icon: "assets/icons/User.svg",
              text: "Privacy",
              press: () {},
              color: AppColors.secondary,
              size: 22,
              press1: () {},
            ),
            ProfileMenu(
              icon: "assets/icons/Bell.svg",
              text: "Notifications",
              press: () {},
              color: AppColors.secondary,
              size: 18,
              press1: () {},
            ),
            ProfileMenu(
              icon: "assets/icons/Question mark.svg",
              text: "Help Center",
              press: () {},
              color: AppColors.secondary,
              size: 22,
              press1: () {},
            ),
            ProfileMenu1(),
            ProfileMenu2(),
            ProfileMenu(
                icon: "assets/icons/Log out.svg",
                text: "Log Out",
                press: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }));
                },
                color: AppColors.secondary,
                size: 22,
                press1: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }));
                })
          ],
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProfileMenu({
    required this.text,
    required this.icon,
    required this.press,
    required this.color,
    required this.size,
    required this.press1,
  });

  final String text, icon;
  final VoidCallback press;
  final VoidCallback press1;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Theme.of(context).cardColor,
              shadowColor: Colors.transparent,
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ))),
          onPressed: press1,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: size,
                color: color,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
                // TextStyle(fontWeight: FontWeight.bold,),
              )),
              IconButton(
                onPressed: press,
                hoverColor: AppColors.secondary,
                icon: const Icon(Icons.arrow_forward_ios),
                color: Colors.black54,
                splashColor: Colors.transparent,
              ),
            ],
          )),
    );
  }
}

class ProfileMenu1 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Theme.of(context).cardColor,
              shadowColor: Colors.transparent,
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ))),
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                UniconsThinline.history,
                color: AppColors.secondary,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                "Purchase History",
                style: Theme.of(context).textTheme.bodyText1,
              )),
              IconButton(
                onPressed: () {},
                hoverColor: AppColors.secondary,
                icon: const Icon(Icons.arrow_forward_ios),
                color: Colors.black54,
                splashColor: Colors.transparent,
              ),
            ],
          )),
    );
  }
}

class ProfileMenu2 extends StatelessWidget {
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Theme.of(context).cardColor,
              shadowColor: Colors.transparent,
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ))),
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                UniconsLine.user_plus,
                color: AppColors.secondary,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                "Invite a friend",
                style: Theme.of(context).textTheme.bodyText1,
              )),
              IconButton(
                onPressed: () {},
                hoverColor: AppColors.secondary,
                icon: const Icon(Icons.arrow_forward_ios),
                color: Colors.black54,
                splashColor: Colors.transparent,
              ),
            ],
          )),
    );
  }
}

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/0x0.jpg"),
            ),
            SizedBox(
              height: 46,
              width: 46,
              // child: FlatButton(
              // onPressed: () {},
              // child: SvgPicture.asset(assetName),),
            )
          ],
        ));
  }
}

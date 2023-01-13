import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:newchat/generated/assets.dart';

import '../loginScreen/login_view.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);
  static const String routeName = "splashScreen";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        Assets.imageLogo,

      ),
      title: Text(
        "zewin",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading...",
      style: TextStyle(
        color: Colors.blue
      ),
      ),
      navigator: Login_Screen_View(),
      durationInSeconds: 5,
      logoWidth: 100,

    );
  }
}

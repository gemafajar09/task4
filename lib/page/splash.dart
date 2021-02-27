import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:task4/page/home.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  static const router = "/splash";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: AnimatedSplash(
        imagePath: 'asset/udacoding.png', 
        home: Home(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
        ),
    );
  }
}
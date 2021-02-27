import 'package:flutter/material.dart';
import 'package:task4/page/detail/beritas.dart';
import 'package:task4/page/detail/gallerys.dart';
import 'package:task4/page/detail/kamuss.dart';
import 'package:task4/page/home.dart';
import 'package:task4/page/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final router = <String, WidgetBuilder>{
    Splash.router: (_) => Splash(),
    Home.router: (_) => Home(),
    Gallerys.router: (_) => Gallerys(),
    Kamuss.router: (_) => Kamuss(),
    Beritas.router: (_) => Beritas(),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: router,
      initialRoute: Splash.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

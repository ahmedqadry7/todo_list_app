import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:session_10_flutter6_todo/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : FlutterSplashScreen.fadeIn(
        backgroundImage: Image(
          image: AssetImage("assets/images/splash.png"),
          alignment: Alignment.center,
        ),
        duration: Duration(seconds: 2),
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(),
        nextScreen: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(context) => HomeScreen(),
      },
    );
  }
}
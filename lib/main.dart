import 'package:apisuperhero/screens/hero_description_screen.dart';
import 'package:apisuperhero/screens/home_screen.dart';
import 'package:apisuperhero/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home'                   : (BuildContext context) => HomeScreen(),
          '/hero-description'       : (BuildContext context) => HeroDescriprionScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );    
  }
}

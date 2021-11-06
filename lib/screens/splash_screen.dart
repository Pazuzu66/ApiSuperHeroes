import 'package:apisuperhero/controllers/superHero_controller.dart';
import 'package:apisuperhero/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final heroController = Get.put(SuperHeroController());
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 8000,
      backgroundColor: Colors.blue.shade200,
      imageSrc: 'https://static.wixstatic.com/media/bf827f_9b5fb5df538f4153908e56d16e151e5b~mv2.gif',
      imageSize: 500,
      text: 'Cargando...',
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),      
      );

    
  }


}
import 'package:demo_math_puzzel/screens/splesh_screen/splash_screen_controller.dart';
import 'package:demo_math_puzzel/screens/splesh_screen/splesh_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: splashPage(),
    );
  }
}

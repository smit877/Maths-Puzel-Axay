import 'package:demo_math_puzzel/screens/home_screen/home_controller.dart';
import 'package:demo_math_puzzel/screens/home_screen/home_screem_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      body: backGroundImage(),
    );
  }
}

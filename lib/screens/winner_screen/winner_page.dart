import 'package:demo_math_puzzel/screens/winner_screen/winner_controller.dart';
import 'package:demo_math_puzzel/screens/winner_screen/winner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WinPage extends StatelessWidget {
  final int? index;
  const WinPage({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(
      WinnerPageController(completeLevel: index ?? 0),
    );
    return Scaffold(
      body: winnerPageWidget(),
    );
  }
}

import 'package:demo_math_puzzel/screens/level_screen/level_controller.dart';
import 'package:demo_math_puzzel/screens/level_screen/level_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LevelController());

    return Scaffold(
      body: GetBuilder<LevelController>(
        id: "GetFunctionUpdate",
        builder: (controller) => controller.lod
            ? levelBg()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

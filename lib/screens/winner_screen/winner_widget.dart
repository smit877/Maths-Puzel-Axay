import 'package:demo_math_puzzel/screens/winner_screen/winner_controller.dart';
import 'package:demo_math_puzzel/utils/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Widget winnerPageWidget() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: Get.width * 0.05,
      vertical: Get.height * 0.15,
    ),
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AssertRes.winnerBackGroundImage),
        fit: BoxFit.fill,
      ),
    ),
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssertRes.winnerFrameImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Lottie.asset(
              "asserts/lottie/punOUFBU4C.json",
            ),
          ),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                "COMPLETED",
                style: TextStyle(
                  fontFamily: "chalk",
                  color: Colors.white,
                  fontSize: Get.width * 0.09,
                ),
              ),
              GetBuilder<WinnerPageController>(
                id: 'level++',
                builder: (controller) => Text(
                  "LEVEL ${controller.completeLevel + 1}",
                  style: TextStyle(
                    fontFamily: "chalk",
                    color: Colors.white,
                    fontSize: Get.width * 0.1,
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.10,
                width: Get.width * 0.500,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 50, color: Colors.orange),
                  ],
                ),
                child: GetBuilder<WinnerPageController>(
                  id: 'levelPlus',
                  builder: (controller) => InkWell(
                    onTap: () => controller.winToNextLevel(),
                    child: Image.asset(
                      AssertRes.nextLevelImage,
                      scale: 4.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.10,
                width: Get.width * 0.500,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange,
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: GetBuilder<WinnerPageController>(
                  id: 'level',
                  builder: (controller) => InkWell(
                    onTap: () => controller.winToPuzzel(),
                    child: Image.asset(
                      AssertRes.pImage,
                      scale: 4.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.10,
                width: Get.width * 0.500,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange,
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: GetBuilder<WinnerPageController>(
                  id: 'menu',
                  builder: (controller) => InkWell(
                    onTap: () => controller.winToMenu(),
                    child: Image.asset(
                      AssertRes.mainMenuImage,
                      scale: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.010),
            ]),
          ),
        ],
      ),
    ),
  );
}

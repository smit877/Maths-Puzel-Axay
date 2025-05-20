import 'package:demo_math_puzzel/screens/play_screen/play_controller.dart';
import 'package:demo_math_puzzel/screens/play_screen/playscreen_common.dart';
import 'package:demo_math_puzzel/utils/asset_res.dart';
import 'package:demo_math_puzzel/utils/data_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget playScreenWidget(BuildContext context) {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AssertRes.playBackGroundImage),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: Get.height * 0.075),

        ///------------------------------------     Play Game First Row-----------------------------------///
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<PlayScreenController>(
              id: 'play_game',
              builder: (controller) => InkWell(
                onTap: () => controller.hintDialog(context),
                child: Image.asset(AssertRes.hintImage, scale: 22),
              ),
            ),
            Container(
              height: Get.height * 0.07,
              width: Get.width * 0.45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AssertRes.levelImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: GetBuilder<PlayScreenController>(
                  id: 'play_game',
                  builder: (controller) => Text(
                    "LEVEL ${controller.index! + 1}",
                    style: TextStyle(
                      fontFamily: "chalk",
                      color: const Color(0xff7f181b),
                      fontSize: Get.width * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GetBuilder<PlayScreenController>(
              id: 'play_game',
              builder: (controller) => InkWell(
                onTap: () => controller.nextLevelFunction(),
                child: Image.asset(
                  AssertRes.nextImage,
                  scale: 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.10),

        ///-------------------------------------------------Table Image----------------------------------------------///
        GetBuilder<PlayScreenController>(
          id: 'play_game',
          builder: (controller) => Image.asset(
            DataRes.tableImages[controller.index!],
            scale: 4.5,
          ),
        ),
        SizedBox(height: Get.height * 0.05),

        ///-------------------------------------  Answer Row  -------------------------------------------------///
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: Get.height * 0.058,
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                  child: GetBuilder<PlayScreenController>(
                    id: 'valueText',
                    builder: (controller) => Text(
                      controller.val.toString(),
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'chalk'),
                    ),
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.03),
              GetBuilder<PlayScreenController>(
                id: "remove",
                builder: (controller) => InkWell(
                  onTap: () => controller.removeButton(),
                  child: Image.asset(
                    AssertRes.backImage,
                    scale: 25,
                  ),
                ),
              ),
            ],
          ),
        ),

        ///---------------------------------------------------------0 to 9 Digit--------------------------------------///
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            playScreenCommon("1", 1),
            playScreenCommon("2", 2),
            playScreenCommon("3", 3),
            playScreenCommon("4", 4),
            playScreenCommon("5", 5),
            playScreenCommon("6", 6),
            playScreenCommon("7", 7),
            playScreenCommon("8", 8),
            playScreenCommon("9", 9),
            playScreenCommon("0", 0),
          ],
        ),
        SizedBox(height: Get.height * 0.02),

        ///---------------------------------------------Submit Button--------------------------------------------------------------///
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<PlayScreenController>(
              id: "submit",
              builder: (controller) => InkWell(
                onTap: () => controller.submitButton(),
                child: Image.asset(AssertRes.submitImage, scale: 3.5),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

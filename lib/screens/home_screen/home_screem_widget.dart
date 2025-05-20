import 'package:demo_math_puzzel/screens/home_screen/home_controller.dart';
import 'package:demo_math_puzzel/utils/asset_res.dart';
import 'package:demo_math_puzzel/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../common/size_box.dart';

Widget backGroundImage() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            AssertRes.backGroundImage,
          ),
          fit: BoxFit.fill),
    ),
    child: Column(
      children: [
        SizedBox(
          height: Get.height * 0.095,
        ),
        sizeBoxCommon(
          Get.width * 0.85,
          Get.height * 0.12,
          Image.asset(AssertRes.mathTextImage),
        ),
        SizedBox(
          height: Get.height * 0.12,
        ),
        GetBuilder<HomePageController>(
          id: 'start',
          builder: (controller) {
            return InkWell(
              onTap: () => controller.startToPlay(),
              child: Image.asset(
                AssertRes.startTextImage,
                scale: 3.2,
              ),
            );
          },
        ),
        SizedBox(
          height: Get.height * 0.020,
        ),
        GetBuilder<HomePageController>(
            id: 'puzzel',
            builder: (controller) {
              return InkWell(
                onTap: () => controller.startToPuzzel(),
                child: Image.asset(
                  AssertRes.puzzleTextImage,
                  scale: 3.2,
                ),
              );
            }),
        SizedBox(
          height: Get.height * 0.020,
        ),
        Image.asset(
          AssertRes.buyTextImage,
          scale: 3.2,
        ),
        SizedBox(
          height: Get.height * 0.15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              InkWell(
                onTap: () {
                  Share.share("com.example.demo_math_puzzel");
                },
                child: Image.asset(
                  AssertRes.shareImage,
                  scale: 17,
                ),
              ),
            Container(
              height: Get.height * 0.060,
              width: Get.width * 0.45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(50),
                  left: Radius.circular(50),
                ),
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: InkWell(
                onTap: () => Get.dialog(
                  const AlertDialog(
                    title: Text(
                      StringRes.privacyPolicy,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.orangeAccent,
                        fontFamily: 'chalk',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  StringRes.privacyPolicy,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontFamily: 'chalk',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Image.asset(
              AssertRes.mailImage,
              scale: 17,
            ),
          ],
        ),
      ],
    ),
  );
}

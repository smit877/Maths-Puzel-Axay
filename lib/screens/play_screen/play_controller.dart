import 'package:demo_math_puzzel/screens/ads/unity_ads.dart';
import 'package:demo_math_puzzel/screens/audio_screen/audio_controller.dart';
import 'package:demo_math_puzzel/screens/winner_screen/winner_page.dart';
import 'package:demo_math_puzzel/services/preffernce_service/preffernce.dart';
import 'package:demo_math_puzzel/utils/asset_res.dart';
import 'package:demo_math_puzzel/utils/data_res.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayScreenController extends GetxController {
  AudioController audioController = Get.find();
  bool watchHint = false;
  String val = '';
  int? index;
  int isHint = 1;

  bool firstAd = true;
  bool secondAd = true;
  bool thirdAd = true;
  static int number = 1;
  // static int number = 0;
  static int hintAnswerIndex = 0;
  // static int number = 1;
  // static int number = 0;/
  static int level1 = 0;
  bool ad = false;

  PlayScreenController(this.index);

  Future<void> numberTap(int value) async {
    val = val + value.toString();
    await audioController.tapButtonSound();
    update(['valueText']);
  }

  Future<void> removeButton() async {
    if (val.isNotEmpty) {
      val = val.substring(0, val.length - 1);
      await audioController.tapButtonSound();
    }
    update(["valueText"]);
  }

  void nextLevelFunction() async {
    await AdManager.showIntAd();
    await PrefService.setValue("win$index", "no");
    await PrefService.setValue("skip$index", "yes");
    int lastLevel = PrefService.getInt("level") ?? 0;
    if (index! >= lastLevel) {
      await PrefService.setValue("level", index! + 1);
      index = PrefService.getInt("level") ?? 0;
    } else {
      index = index! + 1;
    }
    update(['play_game']);
  }

  void hintDialog(BuildContext context) {
    int ads = 0;
    ads = PrefService.getInt('hint') ?? 0;
    if (ads > 0) {
      showDialog(
        context: context,
        builder: (context) => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: DropShadowImage(
                offset: const Offset(10, 10),
                blurRadius: 20,
                image: Image.asset(
                  AssertRes.bannerImage,
                  scale: 4,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LEVEL : ${index! + 1}",
                    style: const TextStyle(
                      fontFamily: "chalk",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.030,
                  ),
                  Text(
                    'ANSWER : ${DataRes.answer[index!]}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'chalk',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      if (watchHint == false) {
        watchHint = true;

        ads = ads - 1;
        PrefService.setValue('hint', ads);
      }
    } else {
      AdManager.showIntAd();
      showDialog(
        context: context,
        builder: (context) => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: DropShadowImage(
                offset: const Offset(10, 10),
                blurRadius: 20,
                image: Image.asset(
                  AssertRes.bannerImage,
                  scale: 4,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LEVEL : ${index! + 1}",
                    style: const TextStyle(
                      fontFamily: "chalk",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.030,
                  ),
                  Text(
                    'ANSWER : ${DataRes.answer[index!]}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'chalk',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      /* showDialog(
        context: context,
        builder: (context) => Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: DropShadowImage(
                offset: const Offset(10, 10),
                blurRadius: 20,
                image: Image.asset(
                  AssertRes.bannerImage,
                  scale: 4,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (firstAd == true) {
                            firstAd = false;
                            AdManager.showIntAd();
                          }
                        },
                        icon: const Icon(Icons.ads_click),
                      ),
                      IconButton(
                        onPressed: () {
                          if (secondAd == true) {
                            secondAd = false;
                            AdManager.showIntAd();
                          }
                        },
                        icon: const Icon(Icons.ads_click),
                      ),
                      IconButton(
                        onPressed: () {
                          if (thirdAd == true) {
                            thirdAd = false;
                            AdManager.showIntAd();
                          }
                        },
                        icon: const Icon(Icons.ads_click),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );*/
      /*   if (firstAd == false && secondAd == false && thirdAd == false) {
        ads = ads + 1;
        PrefService.setValue('hint', ads);
        print(ads);
      }*/
    }
    update(['Hint']);
  }

  void submitButton() async {
    if (val == DataRes.answer[index!]) {
      await PrefService.setValue("win$index", "yes");
      await PrefService.setValue("skip$index", "no");
      int lastLevel = PrefService.getInt("level") ?? 0;
      if (index! >= lastLevel) {
        await PrefService.setValue("level", index! + 1);
      }
      audioController.start.stop();
      Get.off(() => WinPage(
            index: index,
          ));
    } else {
      Get.snackbar(
        "Wrong Answer",
        "try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.black,
        backgroundGradient: const LinearGradient(
          colors: [
            Color(0xff20E2D7),
            Color(0xffF9FEA5),
          ],
        ),
        duration: const Duration(seconds: 2),
        isDismissible: true,
        forwardAnimationCurve: Curves.bounceInOut,
      );
    }
    update(['submit']);
  }
}

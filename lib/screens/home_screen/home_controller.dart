import 'package:demo_math_puzzel/screens/ads/unity_ads.dart';
import 'package:demo_math_puzzel/screens/audio_screen/audio_controller.dart';
import 'package:demo_math_puzzel/screens/level_screen/level_screen.dart';
import 'package:demo_math_puzzel/screens/play_screen/play_screen.dart';
import 'package:demo_math_puzzel/services/preffernce_service/preffernce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  AudioController audioController = Get.put(AudioController());
  int level = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AdManager.loadUnityIntAd();
      await AdManager.loadUnityRewardedAd();
      await audioController.backGroundSound();
    });
  }

  Future<void> startToPlay() async {
    level = PrefService.getInt("level") ?? 0;
    await AdManager.showIntAd();
    print("level------->>--------->>--------->>------>>$level");
    Get.to(() => Playscreen(index: level));
    audioController.homePageSong.stop();
    audioController.startGame();
    update(['start']);
  }

  void startToPuzzel() {
    Get.to(() => const LevelScreen());
    update(['puzzel']);
  }

  @override
  void onClose() {
    audioController.homePageSong.stop();
    super.onClose();
  }
}

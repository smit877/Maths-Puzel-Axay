import 'package:demo_math_puzzel/screens/audio_screen/audio_controller.dart';
import 'package:demo_math_puzzel/screens/home_screen/home_screen.dart';
import 'package:demo_math_puzzel/screens/level_screen/level_screen.dart';
import 'package:demo_math_puzzel/screens/play_screen/play_screen.dart';
import 'package:get/get.dart';

class WinnerPageController extends GetxController {
  @override
  Future<void> onInit() async {
    await audioController.winner();
    super.onInit();
  }

  AudioController audioController = Get.find();
  int completeLevel = 0;
  WinnerPageController({required this.completeLevel});

  Future<void> winToPuzzel() async {
    Get.off(
      () => const LevelScreen(),
    );
    audioController.win.stop();
    await audioController.backGroundSound();
  }

  Future<void> winToNextLevel() async {
    Get.off(() => Playscreen(
          index: completeLevel + 1,
        ));
    audioController.win.stop();
    await audioController.startGame();
  }

  Future<void> winToMenu() async {
    Get.offAll(
      () => const HomeScreen(),
    );
    audioController.win.stop();
    await audioController.backGroundSound();
  }
}

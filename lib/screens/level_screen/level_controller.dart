import 'package:demo_math_puzzel/screens/audio_screen/audio_controller.dart';
import 'package:demo_math_puzzel/services/preffernce_service/preffernce.dart';
import 'package:get/get.dart';

import '../play_screen/play_screen.dart';

class LevelController extends GetxController {
  AudioController audioController = Get.find();
  int gameLevel = 0;
  int level2 = 0;

  List<String> wList = List.filled(75, "pending");
  List<String> sList = List.filled(75, "pending");
  bool lod = false;

  @override
  void onInit() {
    super.onInit();
    get();
  }

  void get() async {
    gameLevel = PrefService.getInt("level") ?? 0;
    print("======gameLevel==========>$gameLevel");
    for (int i = 0; i < gameLevel; i++) {
      String? win = PrefService.getString("win$i");
      String? skip = PrefService.getString("skip$i");
      wList[i] = win;
      sList[i] = skip;
    }
    lod = true;
    update(['GetFunctionUpdate']);
  }

  Future<void> levelToPlayScreen(int index) async {
    Get.off(
      () => Playscreen(index: index),
    );
    audioController.homePageSong.stop();
    await audioController.startGame();
  }
}

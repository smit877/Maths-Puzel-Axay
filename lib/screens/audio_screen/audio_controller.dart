import 'package:demo_math_puzzel/utils/sound_res.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  final homePageSong = AudioPlayer();
  final win = AudioPlayer();
  final start = AudioPlayer();
  final tap = AudioPlayer();

  Future<void> backGroundSound() async {
    await homePageSong.setAsset(SoundRes.gameBackGround);

    if (homePageSong.playing) {
      homePageSong.stop();
    } else {
      homePageSong.play();
      homePageSong.setLoopMode(LoopMode.one);
    }
  }

  Future<void> winner() async {
    await win.setAsset(SoundRes.winnerGameSound);
    if (win.playing) {
      win.stop();
    } else {
      win.play();
      win.setLoopMode(LoopMode.off);
    }
  }

  Future<void> startGame() async {
    await start.setAsset(SoundRes.startGameSound);
    if (start.playing) {
      start.stop();
    } else {
      start.play();
      start.setLoopMode(LoopMode.one);
    }
  }

  Future<void> tapButtonSound() async {
    await tap.setAsset(SoundRes.tapGameSound);
    tap.play();
    //tap.setLoopMode(LoopMode.off);
  }
}

import 'dart:async';

import 'package:demo_math_puzzel/screens/home_screen/home_screen.dart';
import 'package:demo_math_puzzel/services/preffernce_service/preffernce.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    int? hint = PrefService.getInt("hint");
    if (hint == null) {
      PrefService.setValue("hint", 5);
    }
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => const HomeScreen()),
    );
    super.onInit();
  }
}

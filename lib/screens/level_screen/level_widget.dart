import 'package:demo_math_puzzel/screens/level_screen/level_controller.dart';
import 'package:demo_math_puzzel/utils/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

Widget levelBg() {
  return Container(
    height: Get.height,
    width: Get.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AssertRes.levelBackGroundImage),
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      children: [
        SizedBox(
          height: Get.height * 0.050,
        ),
        SizedBox(
          height: Get.height * 0.15,
          width: Get.width * 0.80,
          child: Image.asset(
            AssertRes.pImage,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: Get.height * 0.80,
          width: double.infinity,
          child: GetBuilder<LevelController>(
            id: "idLevel",
            builder: (controller) {
              return Animate(
                effects: const [
                  ScaleEffect(
                    duration: Duration(seconds: 1),
                  ),
                ],
                child: GridView.builder(
                  primary: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: 75,
                  itemBuilder: (context, index) {
                    if (controller.wList[index] == "yes") {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssertRes.boxOpen),
                          ),
                        ),
                        child: GetBuilder<LevelController>(
                          id: 'levelUpdate',
                          builder: (controller) => InkWell(
                            onTap: () => controller.levelToPlayScreen(index),
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                left: 5,
                                top: 10,
                              ),
                              margin: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AssertRes.loseStarImage),
                                    scale: 15),
                              ),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontFamily: "chalk",
                                  color: const Color(0xff7f181b),
                                  fontSize: Get.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    if (controller.sList[index] == "yes") {
                      return Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AssertRes.boxOpen),
                          ),
                        ),
                        child: InkWell(
                          onTap: () => controller.levelToPlayScreen(index),
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(
                              fontFamily: "chalk",
                              color: const Color(0xfffcac70),
                              fontSize: Get.width * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }

                    if (controller.gameLevel == index) {
                      return InkWell(
                        onTap: () => controller.levelToPlayScreen(index),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AssertRes.boxOpen),
                            ),
                          ),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                            ),
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontFamily: "chalk",
                                color: const Color(0xfffcac70),
                                fontSize: Get.width * 0.07,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssertRes.boxOpen),
                        ),
                      ),
                      child: Image.asset(AssertRes.boxClose),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

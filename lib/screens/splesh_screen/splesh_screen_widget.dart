import 'package:demo_math_puzzel/utils/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget splashPage() {
  return SizedBox(
    height: Get.height,
    width: Get.width,
    child: Image.asset(
      AssertRes.spleshScreenImage,
    ),
  );
}

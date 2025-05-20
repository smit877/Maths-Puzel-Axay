import 'package:flutter/cupertino.dart';

Widget sizeBoxCommon(double width, double height, Widget widget) {
  return SizedBox(
    height: height,
    width: width,
    child: widget,
  );
}

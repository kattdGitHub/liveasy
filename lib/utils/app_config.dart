import 'package:flutter/cupertino.dart';

class AppConfig {
  static double height = 0;
  static double width = 0;

  static void init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}

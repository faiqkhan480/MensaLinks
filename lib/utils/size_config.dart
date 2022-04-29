import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData _mediaQuery;
  static late double screenHeight;
  static late double screenWidth;

  static void init({required BuildContext context}) {
    _mediaQuery = MediaQuery.of(context);
    screenHeight = _mediaQuery.size.height;
    screenWidth = _mediaQuery.size.width;
  }
}

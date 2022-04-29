import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/screens/splash/splash.dart';
import 'package:mensa_links/utils/constants.dart';

void main() {
  runApp(const MensaLinks());
}

class MensaLinks extends StatelessWidget {
  const MensaLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

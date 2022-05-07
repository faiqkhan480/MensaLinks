import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/lang/lang.dart';
import 'package:mensa_links/screens/splash/splash.dart';
import 'package:mensa_links/utils/constants.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MensaLinks());
}

class MensaLinks extends StatelessWidget {
  const MensaLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      translations: Lang(),
      locale: Constants.currentLocale,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      // home: Splash(),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.list,
    );
  }
}

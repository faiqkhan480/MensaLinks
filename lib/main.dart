import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/lang/lang.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, // transparent status bar));
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
      theme: ThemeData(
        fontFamily: "Ubuntu",
        primaryColor: AppColors.primaryColor,
        textTheme: const TextTheme(
          subtitle1: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
      ),

      debugShowCheckedModeBanner: false,
      color: AppColors.primaryColor,
      // initialRoute: AppRoutes.SPLASH,
      initialRoute: AppRoutes.SPLASH,
      // scrollBehavior: ScrollBehavior(androidOverscrollIndicator: AndroidOverscrollIndicator.),
      getPages: AppPages.list,
    );
  }
}

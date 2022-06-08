import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/size_config.dart';

import '../../utils/constants.dart';
import '../../utils/screen_properties.dart';
import '../../utils/assets.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_widgets.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset(Assets.linksLogo, color: Colors.white, height: 150,)),
      bottomNavigationBar: Container(
        decoration: UIStyleProperties.styleRadiusDecoration(radius: 50),
        height: Get.height * 0.28,
        padding: UIStyleProperties.insetsTop20Hzt25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: TitleText(
                text: args?['welcome'] ?? 'account_successfully_created',
                weight: FontWeight.bold,
                color: AppColors.primaryColor,
                size: Constants.heading,
                align: TextAlign.center,
              ),
            ),
            CustomButton(
              label: args?['welcome'] != null ? 'Sign In' : 'set_your_new_pin',
              alignment: Alignment.center,
              onTap: () => args?['welcome'] != null ? Get.toNamed(AppRoutes.HOME) : Get.toNamed(AppRoutes.PIN, arguments: "signup"),
            ),
          ],
        ),
      ),
    );
  }
}

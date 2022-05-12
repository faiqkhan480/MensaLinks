import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/widgets/custom_button.dart';

import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/widget_util.dart';
import '../../widgets/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backBody(),

          frontBody(),
        ],
      ),
    );
  }

  Widget backBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(
                text: 'Welcome\nJobin,',
                weight: FontWeight.bold,
                color: AppColors.primaryColor,
                size: Constants.heading20,
                // align: TextAlign.center,
              ),
              
              IconButton(
                  onPressed: () => null,
                  icon: const Icon(Icons.power_settings_new_rounded, color: AppColors.primaryColor, size: 30,)
              )
            ],
          ),

          WidgetUtils.spaceVrt20,

          TitleText(
            text: 'YOUR BALANCE',
            weight: FontWeight.w400,
            color: AppColors.primaryColor,
            size: Constants.smallText,
            // align: TextAlign.center,
          ),

          WidgetUtils.spaceVrt15,

          TitleText(
            text: 'AED 0.0',
            weight: FontWeight.bold,
            color: AppColors.primaryColor,
            size: Constants.title,
            // align: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget frontBody() {
    return Container(
      margin: const EdgeInsets.only(top: 210),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50))
      ),
      padding: UIStyleProperties.insetsVrt30Hzt35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleText(
            text: 'For Family',
            weight: FontWeight.w400,
            color: AppColors.white,
            size: Constants.heading20,
            // align: TextAlign.center,
          ),

          boxRow(),

          TitleText(
            text: 'For Domestic workers',
            weight: FontWeight.w400,
            color: AppColors.white,
            size: Constants.heading20,
            // align: TextAlign.center,
          ),

          boxRow(),
          WidgetUtils.spaceVrt15,
          CustomButton(
              label: "Register Payment",
              invert: true,
              onTap: () => Get.toNamed(AppRoutes.REGISTERPAYMENT),
            horizontalMargin: 20,
          ),
          WidgetUtils.spaceVrt15,
          CustomButton(
              label: "Manage Accounts",
              invert: true,
            fontSize: Constants.regularText,
              horizontalMargin: 20,
              onTap: () => Get.toNamed(AppRoutes.MANAGEACCOUNT),
          ),
        ],
      ),
    );
  }

  Widget boxRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        box("Create\nAccount", () => Get.toNamed(AppRoutes.CREATEACCOUNT)),
        box("Transfer\nMoney", () => Get.toNamed(AppRoutes.TRANSFERMONEY)),
      ],
    );
  }

  Widget box(String text, VoidCallback action) {
    return InkWell(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0)
        ),
        padding: UIStyleProperties.insetsVrt10Hzt25,
        margin: UIStyleProperties.insetsVrt30Hzt20,
        child: TitleText(
          text: text,
          weight: FontWeight.w500,
          color: AppColors.primaryColor,
          size: Constants.heading20,
          align: TextAlign.center,
        ),
      ),
    );
  }
}

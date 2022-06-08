import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/home_controller.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/widgets/custom_button.dart';

import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/widget_util.dart';
import '../../widgets/text_widgets.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            backBody(),

            Obx(frontBody),
          ],
        ),
      ),
    );
  }

  Widget backBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
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
                  onPressed: controller.handleLogout,
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
      margin: const EdgeInsets.only(top: 180),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50))
      ),
      padding: UIStyleProperties.insetsVrt30Hzt35,
      child: Column(
        // padding: UIStyleProperties.insetsVrt30Hzt35,
        // physics: Constants.scrollPhysics,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // IF HOUSE HOLD LOGIN
          if(!controller.businessLogin())...[
            TitleText(
              text: 'For Family',
              weight: FontWeight.w400,
              color: AppColors.white,
              size: Constants.heading20,
              // align: TextAlign.center,
            ),
            // ON FAMILY
            boxRow(
                "Create\nAccount",
                    () => Get.toNamed(AppRoutes.CREATEACCOUNT, arguments: 'for_family'),
                "Transfer\nMoney",
                    () => Get.toNamed(AppRoutes.TRANSFERMONEY)
            ),

            TitleText(
              text: 'For Domestic workers',
              weight: FontWeight.w400,
              color: AppColors.white,
              size: Constants.heading20,
              // align: TextAlign.center,
            ),

            // ON WORKER
            boxRow(
                "Create\nAccount",
                    () => Get.toNamed(AppRoutes.CREATEACCOUNT, arguments: 'for_worker'),
                "Process\nSalary",
                    () => Get.toNamed(AppRoutes.PROCESSSALRY)
            ),
          ]
          // IF BUSINESS LOGIN
          else...[
            const Spacer(flex: 1),
            CustomButton(
              label: "Apply Staff Card",
              invert: true,
              radius: 10,
              onTap: () => Get.toNamed(AppRoutes.CREATEACCOUNT, arguments: 'for_staff'),
              horizontalMargin: 20,
            ),
            WidgetUtils.spaceVrt40,
            CustomButton(
              label: "Process Staff Salary",
              invert: true,
              radius: 10,
              onTap: () => Get.toNamed(AppRoutes.PROCESSSTAFFSALARY),
              horizontalMargin: 20,
            ),
            const Spacer(flex: 3),
          ],

          WidgetUtils.spaceVrt15,
          CustomButton(
              label: "Register Payment",
              invert: true,
              radius: 10,
              // alignment: Alignment.center,
              onTap: () => Get.toNamed(AppRoutes.REGISTERPAYMENT),
            horizontalMargin: 20,
          ),
          WidgetUtils.spaceVrt15,
          CustomButton(
              label: "Manage Accounts",
              invert: true,
            radius: 10,
            minHeight: 0.05,
            // alignment: Alignment.center,
            fontSize: Constants.regularText,
              horizontalMargin: 20,
              onTap: () => Get.toNamed(AppRoutes.MANAGEACCOUNT),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget boxRow(String text1, Function() action1, String text2, Function() action2) {
    return Padding(
      padding: UIStyleProperties.insetsVrt30Hzt20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          box(text1, action1),
          box(text2, action2),
        ],
      ),
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
        child: TitleText(
          text: text,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
          size: Constants.heading18,
          align: TextAlign.center,
        ),
      ),
    );
  }
}

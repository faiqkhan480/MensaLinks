import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/splash_controller.dart';
import 'package:mensa_links/screens/auth/register.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/title_text.dart';

class Splash extends StatelessWidget {
  final controller = Get.put(SplashController());
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context: context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: ColoredBox(
              color: AppColors.primaryColor,
              child: Container(),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Constants.radius,
                  ),
                  topRight: Radius.circular(
                    Constants.radius,
                  ),
                ),
              ),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * Constants.bottomSize,
              child: Obx(
                () => getBottomWidget(),
              ),
            ),
          ),
          Obx(
            () => controller.loading.value
                ? AnimatedPositioned(
                    left: controller.isInitialized.value
                        ? 0
                        : SizeConfig.screenWidth * 0.45,
                    bottom: controller.isInitialized.value
                        ? SizeConfig.screenHeight * 0.5
                        : SizeConfig.screenHeight * 0.65,
                    width: 40,
                    height: 40,
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.pink,
                    ),
                    duration: const Duration(milliseconds: 1500),
                  )
                : const SizedBox(),
          ),
          Obx(
            () => controller.loading.value
                ? AnimatedPositioned(
                    right: controller.isInitialized.value
                        ? 0
                        : SizeConfig.screenWidth * 0.45,
                    bottom: controller.isInitialized.value
                        ? SizeConfig.screenHeight * 0.5
                        : SizeConfig.screenHeight * 0.65,
                    width: 40,
                    height: 40,
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.pink,
                    ),
                    duration: const Duration(milliseconds: 1500),
                  )
                : const SizedBox(),
          ),
          Obx(
            () => !controller.loading.value
                ? SizedBox(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.7,
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget getBottomWidget() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: controller.onSignUp.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                  text: 'signUpAs'.tr,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  size: Constants.heading,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'houseHead'.tr,
                  onTap: () {
                    Get.to(
                      () => Register(),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'business'.tr,
                  onTap: () {
                    Get.to(
                      () => Register(),
                    );
                  },
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                  text: 'welcome'.tr,
                  weight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  size: Constants.heading,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'signUpButton'.tr,
                  onTap: () async {
                    controller.onSignUpPressed();
                  },
                ),
              ],
            ),
    );
  }
}

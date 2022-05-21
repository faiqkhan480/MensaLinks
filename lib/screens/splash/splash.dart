import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/splash_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

class Splash extends StatelessWidget {
  final controller = Get.put(SplashController());
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration _animationDuration = const Duration(milliseconds: 1000);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
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
              width: Get.width,
              height: Get.height * Constants.bottomSize,
              child: Obx(
                () => getBottomWidget(),
              ),
            ),
          ),
          Obx(
            () => controller.loading.value
                ? AnimatedPositioned(
                    left: controller.isInitialized.value ? 0 : Get.width * .25,
                    bottom: controller.isInitialized.value
                        ? Get.height * 0.5
                        : Get.height * 0.65,
                    width: Get.width * .35,
                    height: Get.width * .35,
                    child: SvgPicture.asset(Assets.leftGear, fit: BoxFit.fill),
                    // child: Container(
                    //   width: 40,
                    //   height: 40,
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    duration: _animationDuration,
                  )
                : const SizedBox(),
          ),
          Obx(
            () => controller.loading.value
                ? AnimatedPositioned(
                    right: controller.isInitialized.value ? 0 : Get.width * .24,
                    bottom: controller.isInitialized.value
                        ? Get.height * 0.5
                        : Get.height * 0.65,
                    width: Get.width * .35,
                    height: Get.width * .35,
                    child: Image.asset(Assets.rightGear),
                    // child: Container(
                    //   width: 40,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white.withOpacity(0.3),
                    //       shape: BoxShape.circle),
                    // ),
                    duration: _animationDuration,
                  )
                : const SizedBox(),
          ),
          Obx(
            () => !controller.loading.value
                ? SizedBox(
                    width: Get.width,
                    height: Get.height * 0.7,
                    child: Center(
                      // child: SvgPicture.asset(Assets.rightGear),
                      child: SvgPicture.asset(
                        Assets.linksLogo,
                      ),
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
                  onTap: () => Get.toNamed(AppRoutes.REGISTER),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'business'.tr,
                  onTap: () => Get.toNamed(AppRoutes.REGISTER),
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
                  onTap: controller.onSignUpPressed,
                ),
              ],
            ),
    );
  }
}

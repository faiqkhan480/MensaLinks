import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mensa_links/utils/screen_properties.dart';
import 'package:mensa_links/utils/widget_util.dart';

import '../../controller/splash_controller.dart';
import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_widgets.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

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
                  size: Constants.subHeading,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'houseHead'.tr,
                  onTap: () => controller.handleNavigation("houseHead"),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'business'.tr,
                  onTap: () => controller.handleNavigation("business"),
                ),
              ],
            )
          : Padding(
            padding: UIStyleProperties.topInsets40,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TitleText(
                    text: 'welcome'.tr,
                    weight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    size: Constants.heading,
                  ),
                  WidgetUtils.spaceVrt40,
                  CustomButton(
                    label: 'signUpButton'.tr,
                    onTap: controller.onSignUpPressed,
                  ),
                ],
              ),
          ),
    );
  }
}

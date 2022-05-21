import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controller/emirates_id_scanner_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/size_config.dart';
import '../../widgets/custom_animated_checkmark.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_default_layout.dart';
import '../../widgets/text_widgets.dart';

class RegisterScanner extends StatelessWidget {
  RegisterScanner({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    final emiratesIdController = Get.put(EmiratesIdScanController());
    return SimpleDefaultScreenLayout(
      // showAppBar: false,
      showAppBarBackButton: true,
      appbarTitle: SvgPicture.asset(
        Assets.logo,
      ),
      child: Container(
        width: Get.width,
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: TitleText(
                text: 'createAccount'.tr,
                size: Constants.heading,
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
                align: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: TitleText(
                text: 'scanID'.tr,
                size: Constants.subHeading,
                align: TextAlign.center,
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: emiratesIdController.onQRViewCreated,
                    ),
                    Positioned(
                      top: 35,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text('pleaseScanTheCode'.tr,
                            style: const TextStyle(color: AppColors.white)),
                      ),
                    ),
                    emiratesIdController.obx(
                      (state) => _buildAnimatedCheckMark(emiratesIdController),
                      onEmpty: null,
                      onLoading: const SizedBox(),
                    ),
                    Positioned.fill(
                      top: 70,
                      left: 30,
                      bottom: 60,
                      right: 30,
                      child: ColoredBox(
                        color: AppColors.white.withOpacity(.2),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 30,
                      bottom: 60,
                      right: 30,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          //Top Left
                          _buildArrow(angle: 45, top: -5, left: -5),
                          //Top Right
                          _buildArrow(angle: 135, top: -5, right: -5),
                          //Bottom Left
                          _buildArrow(angle: -45, bottom: -5, left: -5),
                          //Bottom Right
                          _buildArrow(angle: -135, bottom: -5, right: -5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() =>
                Spacer(flex: emiratesIdController.hasScanned.value ? 1 : 2)),
            Obx(() {
              if (!emiratesIdController.hasScanned.value) {
                return const SizedBox();
              }
              return Flexible(
                flex: 2,
                child: CustomButton(
                  onTap: () async {
                    // await controller.onScanNow();
                    Get.offAndToNamed(AppRoutes.REGISTERDETAIL);
                  },
                  label: 'continue'.tr,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  _buildAnimatedCheckMark(EmiratesIdScanController controller) {
    return Positioned.fill(
      top: 70,
      left: 30,
      bottom: 60,
      right: 30,
      child: Center(
        child: SizedBox(
          height: 75,
          width: 75,
          child: CustomAnimatedCheckMark(
              strokeWidth: 6, duration: controller.checkMarkDuration),
        ),
      ),
    );
  }

  Positioned _buildArrow({
    required double angle,
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: Transform.rotate(
            angle: (pi / 180) * angle,
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/screens/auth/register_details.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/title_text.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      // showAppBar: false,
      showAppBarBackButton: true,
      appbarTitle: Image.asset(Assets.logo,),
      child: RegisterForm(controller: controller,),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
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
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: TitleText(
                  text: 'scanIdDesc'.tr,
                  align: TextAlign.center,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomButton(
                onTap: () async {
                  // await controller.onScanNow();
                  Get.toNamed(AppRoutes.REGISTERDETAIL);
                },
                label: 'scanNow'.tr,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

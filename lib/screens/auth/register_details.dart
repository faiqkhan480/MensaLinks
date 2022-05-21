import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/routes/app_routes.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/custom_dropdown.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/text_widgets.dart';

import '../../utils/screen_properties.dart';
import '../../utils/widget_util.dart';

class RegisterDetails extends StatelessWidget {
  const RegisterDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'createAccount',
      pageTitleSize: Constants.pageTitle,
      child: PersonalDetails(),
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key}) : super(key: key);
  final emiratesIDFormat = "###-####-######-#";
  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Container(
      // width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            Constants.radius,
          ),
          topLeft: Radius.circular(
            Constants.radius,
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: Constants.scrollPhysics,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: UIStyleProperties.insetsHzt20,
              child: TitleText(
                text: 'personalDetails'.tr,
                size: Constants.heading18,
                align: TextAlign.left,
                weight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
            CustomTextField(
              label: 'fullName'.tr,
              controller: TextEditingController(),
            ),
            CustomTextField(
              label: 'iDNumber'.tr,
              controller: TextEditingController(),
              keyboardType: TextInputType.number,
              inputFormatters: [MaskTextInputFormatter(mask: emiratesIDFormat)],
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdown(
                      label: 'iDExpiry'.tr,
                      hint: 'day'.tr,
                      width: SizeConfig.screenWidth * 0.25,
                      values: List.generate(
                        31,
                        (index) {
                          return (index + 1).toString();
                        },
                      ),
                      onValueSelected: (String? item) {
                        log('Selected Date: $item');
                        controller.expiryDate.value = item;
                      },
                      selectedValue: controller.expiryDate.value,
                    ),
                  ),
                  WidgetUtils.spaceHzt5,
                  Expanded(
                    child: CustomDropdown(
                      label: '',
                      hint: 'month'.tr,
                      width: SizeConfig.screenWidth * 0.25,
                      values: controller.months,
                      onValueSelected: (String? item) {
                        log('Selected Month: $item');
                        controller.expiryMonth.value = item;
                      },
                      selectedValue: controller.expiryMonth.value,
                    ),
                  ),
                  WidgetUtils.spaceHzt5,
                  Expanded(
                    child: CustomDropdown(
                      label: '',
                      hint: 'year'.tr,
                      width: SizeConfig.screenWidth * 0.25,
                      values: List.generate(
                        30,
                        (index) {
                          return (1990 + index).toString();
                        },
                      ),
                      onValueSelected: (String? item) {
                        log('Selected Year: $item');
                        controller.expiryYear.value = item;
                      },
                      selectedValue: controller.expiryYear.value,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomDropdown(
                      label: 'DOB'.tr,
                      hint: 'day'.tr,
                      width: SizeConfig.screenWidth * 0.25,
                      values: List.generate(
                        31,
                        (index) {
                          return (index + 1).toString();
                        },
                      ),
                      onValueSelected: (String? item) {
                        log('Selected Date: $item');
                        controller.birthDate.value = item;
                      },
                      selectedValue: controller.birthDate.value,
                    ),
                  ),
                  WidgetUtils.spaceHzt5,
                  Expanded(
                    child: CustomDropdown(
                      label: '',
                      hint: 'month'.tr,
                      width: SizeConfig.screenWidth * 0.25,
                      values: controller.months,
                      onValueSelected: (String? item) {
                        log('Selected Month: $item');
                        controller.birthMonth.value = item;
                      },
                      selectedValue: controller.birthMonth.value,
                    ),
                  ),
                  WidgetUtils.spaceHzt5,
                  Expanded(
                    child: CustomDropdown(
                      label: '',
                      hint: 'year'.tr,
                      width: SizeConfig.screenWidth * 0.25,
                      values: List.generate(
                        30,
                        (index) {
                          return (1990 + index).toString();
                        },
                      ),
                      onValueSelected: (String? item) {
                        log('Selected Year: $item');
                        controller.birthYear.value = item;
                      },
                      selectedValue: controller.birthYear.value,
                    ),
                  ),
                ],
              ),
            ),
            // WidgetUtils.spaceVrt25,
            CustomButton(
              label: 'next'.tr,
              // alignment: Alignment.center,
              verticalMargin: 45,
              onTap: () => Get.toNamed(AppRoutes.CONTACTDETAIL),
            ),

            TextButton(
              onPressed: () => null,
              child: Text(' Edit Info '),
              style: TextButton.styleFrom(
                  primary: AppColors.darkGrey,
                  textStyle: TextStyle(decoration: TextDecoration.underline)),
            )
          ],
        ),
      ),
    );
  }
}

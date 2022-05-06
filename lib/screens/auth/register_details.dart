import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/screens/auth/contact_detail.dart';
import 'package:mensa_links/utils/colors.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/custom_dropdown.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/simple_default_layout.dart';
import 'package:mensa_links/widgets/title_text.dart';

class RegisterDetails extends StatelessWidget {
  final AuthController controller;
  const RegisterDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      child: PersonalDetails(
        controller: controller,
      ),
    );
  }
}

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
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
              topRight: Radius.circular(
                Constants.radius,
              ),
              topLeft: Radius.circular(
                Constants.radius,
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TitleText(
                    text: 'createAccount'.tr,
                    size: Constants.heading,
                    color: AppColors.primaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TitleText(
                    text: 'personalDetails'.tr,
                    size: Constants.subHeading2,
                    align: TextAlign.left,
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
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDropdown(
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
                      CustomDropdown(
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
                      CustomDropdown(
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
                    ],
                  ),
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDropdown(
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
                      CustomDropdown(
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
                      CustomDropdown(
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
                    ],
                  ),
                ),
                CustomButton(
                  label: 'next'.tr,
                  alignment: Alignment.center,
                  verticalMargin: 15,
                  onTap: () {
                    Get.to(
                      () => const ContactDetails(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mensa_links/controller/auth_controller.dart';
import 'package:mensa_links/screens/auth/contact_detail.dart';
import 'package:mensa_links/utils/assets.dart';
import 'package:mensa_links/utils/constants.dart';
import 'package:mensa_links/utils/size_config.dart';
import 'package:mensa_links/widgets/custom_button.dart';
import 'package:mensa_links/widgets/custom_dropdown.dart';
import 'package:mensa_links/widgets/custom_text_field.dart';
import 'package:mensa_links/widgets/title_text.dart';

class RegisterDetails extends StatelessWidget {
  final AuthController controller;
  const RegisterDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: Constants.primaryColor,
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Image.asset(
                      Assets.miniLogo,
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: Constants.backgroundColor,
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
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: TitleText(
                              text: 'Create Account',
                              size: Constants.heading,
                              color: Constants.primaryColor,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            alignment: Alignment.centerLeft,
                            child: TitleText(
                              text: 'Personal Details',
                              size: Constants.subHeading2,
                              align: TextAlign.left,
                              color: Constants.primaryColor,
                            ),
                          ),
                          CustomTextField(
                            label: 'Full Name',
                            controller: TextEditingController(),
                          ),
                          CustomTextField(
                            label: 'ID Number',
                            controller: TextEditingController(),
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomDropdown(
                                  label: 'ID Expiry',
                                  hint: 'Day',
                                  width: SizeConfig.screenWidth * 0.3,
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
                                  hint: 'Month',
                                  width: SizeConfig.screenWidth * 0.3,
                                  values: controller.months,
                                  onValueSelected: (String? item) {
                                    log('Selected Month: $item');
                                    controller.expiryMonth.value = item;
                                  },
                                  selectedValue: controller.expiryMonth.value,
                                ),
                                CustomDropdown(
                                  label: '',
                                  hint: 'Year',
                                  width: SizeConfig.screenWidth * 0.3,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomDropdown(
                                  label: 'Date of Birth',
                                  hint: 'Day',
                                  width: SizeConfig.screenWidth * 0.3,
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
                                  hint: 'Month',
                                  width: SizeConfig.screenWidth * 0.3,
                                  values: controller.months,
                                  onValueSelected: (String? item) {
                                    log('Selected Month: $item');
                                    controller.birthMonth.value = item;
                                  },
                                  selectedValue: controller.birthMonth.value,
                                ),
                                CustomDropdown(
                                  label: '',
                                  hint: 'Year',
                                  width: SizeConfig.screenWidth * 0.3,
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
                            label: 'Next',
                            verticalMargin: 15,
                            onTap: () {
                              Get.to(
                                () => ContactDetails(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

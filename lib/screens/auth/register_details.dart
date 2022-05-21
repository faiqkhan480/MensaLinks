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
    return SingleChildScrollView(
      physics: Constants.scrollPhysics,
      padding: UIStyleProperties.insetsVrt8Hzt20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetUtils.spaceVrt25,
          const SeparatorText("personalDetails"),
          CustomTextField(
            label: 'fullName'.tr,
            labelColor: AppColors.slightlyGrey,
            labelVerticalPadding: UIStyleProperties.insetsVrt8,
            labelSize: Constants.heading18,
            controller: TextEditingController(),
          ),
          CustomTextField(
            label: 'iDNumber'.tr,
            labelColor: AppColors.slightlyGrey,
            labelVerticalPadding: UIStyleProperties.insetsVrt8,
            labelSize: Constants.heading18,
            controller: TextEditingController(),
            keyboardType: TextInputType.number,
            marginTop: 0,
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
                        values: List.generate(31, (index) {return (index + 1).toString();},
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
                      values: List.generate(30, (index) {return (1990 + index).toString();},),
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
                    label: 'dob'.tr,
                    hint: 'day'.tr,
                    values: List.generate(31, (index) {return (index + 1).toString();},
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
                    values: List.generate(30, (index) {return (1990 + index).toString();},),
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
          // WidgetUtils.spaceVrt25,
          CustomButton(
            label: 'next'.tr,
            // alignment: Alignment.center,
            verticalMargin: 45,
            onTap: () => Get.toNamed(AppRoutes.CONTACTDETAIL),
          ),

          TextButton(
            onPressed: () => null,
            child: const Text(' Edit Info '),
            style: TextButton.styleFrom(
                primary: AppColors.darkGrey,
                textStyle: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  fontSize: Constants.heading18
                )),
          )
        ],
      ),
    );
  }
}

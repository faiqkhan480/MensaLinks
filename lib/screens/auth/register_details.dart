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

  AuthController get _controller => Get.find<AuthController>();
  final emiratesIDFormat = "###-####-######-#";
  @override
  Widget build(BuildContext context) {
    return SimpleDefaultScreenLayout(
      pageTitle: 'createAccount',
      pageTitleSize: Constants.pageTitle,
      child: Obx(body),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: Constants.scrollPhysics,
      padding: UIStyleProperties.insetsVrt8Hzt20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetUtils.spaceVrt25,
          const SeparatorText("personalDetails"),
          CustomTextField(
            readOnly: _controller.isReadOnly(),
            label: 'fullName'.tr,
            filled: _controller.isReadOnly(),
            labelColor: AppColors.slightlyGrey,
            labelVerticalPadding: UIStyleProperties.insetsVrt8,
            labelSize: Constants.heading18,
            controller: _controller.fullName,
          ),
          CustomTextField(
            readOnly: _controller.isReadOnly(),
            filled: _controller.isReadOnly(),
            label: 'iDNumber'.tr,
            labelColor: AppColors.slightlyGrey,
            labelVerticalPadding: UIStyleProperties.insetsVrt8,
            labelSize: Constants.heading18,
            controller: _controller.idNumber,
            keyboardType: TextInputType.number,
            marginTop: 0,
            inputFormatters: [MaskTextInputFormatter(mask: emiratesIDFormat)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  label: 'iDExpiry'.tr,
                  hint: 'day'.tr,
                  values: List.generate(31, (index) {return (index + 1).toString();},),
                  onValueSelected: (String? item) {
                    // log('Selected Date: $item');
                    // _controller.expiryDate.value = item;
                  },
                  selectedValue: _controller.expiryDate.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  label: '',
                  hint: 'month'.tr,
                  values: _controller.months,
                  onValueSelected: (String? item) {
                    // log('Selected Month: $item');
                    // _controller.expiryMonth.value = item;
                  },
                  selectedValue: _controller.expiryMonth.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  label: '',
                  hint: 'year'.tr,
                  values: Constants.expiryYears,
                  onValueSelected: (String? item) {
                    // log('Selected Year: $item');
                    _controller.expiryYear.value = item!;
                  },
                  selectedValue: _controller.expiryYear.value,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 20),
            child: TitleText(
              text: "dob",
              color: AppColors.primaryColor.withOpacity(0.5),
              weight: FontWeight.bold,
              size: Constants.heading18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  hint: 'day'.tr,
                  values: List.generate(31, (index) {return (index + 1).toString();},
                  ),
                  onValueSelected: (String? item) {
                    log('Selected Date: $item');
                    _controller.expiryDate.value = item!;
                  },
                  selectedValue: _controller.expiryDate.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  hint: 'month'.tr,
                  values: _controller.months,
                  onValueSelected: (String? item) {
                    log('Selected Month: $item');
                    _controller.expiryMonth.value = item!;
                  },
                  selectedValue: _controller.birthMonth.value,
                ),
              ),
              WidgetUtils.spaceHzt5,
              Expanded(
                child: CustomDropdown(
                  readOnly: _controller.isReadOnly(),
                  filled: _controller.isReadOnly(),
                  hint: 'year'.tr,
                  values: Constants.listOfYears,
                  onValueSelected: (String? item) {
                    _controller.expiryYear.value = item!;
                  },
                  selectedValue: _controller.birthYear.value,
                ),
              ),
            ],
          ),
          // WidgetUtils.spaceVrt25,
          CustomButton(
            label: 'next'.tr,
            // alignment: Alignment.center,
            verticalMargin: 45,
            onTap: () => Get.toNamed(AppRoutes.CONTACTDETAIL),
          ),

          TextButton(
            onPressed: () => _controller.handleEditForm(false),
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
